from wsgiref.simple_server import make_server
from pyramid.config import Configurator
from pyramid.response import Response
from kafka import KafkaProducer

def hello_world(request):
    return Response('Hello World! <a href="/url/google.com">Check google.com</a>')

def url(request):
    producer = KafkaProducer(bootstrap_servers=['kafka:9092'])
    domain = request.matchdict['domain']

    producer.send('urls_to_check', value=str.encode(domain))
    producer.flush()

    return Response(domain)


if __name__ == '__main__':
    with Configurator() as config:
        config.add_route('hello', '/')
        config.add_view(hello_world, route_name='hello')
        config.add_route('url', '/url/{domain}')
        config.add_view(url, route_name='url')
        app = config.make_wsgi_app()
    server = make_server('0.0.0.0', 80, app)
    server.serve_forever()