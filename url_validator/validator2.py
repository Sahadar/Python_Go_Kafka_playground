import random
from kafka import KafkaConsumer
from kafka import KafkaProducer
from json import loads
import requests
import time

if __name__ == '__main__':
    topic_name = 'urls_to_check'

    consumer = KafkaConsumer(
        bootstrap_servers=['kafka:9092'],
        # auto_offset_reset='earliest',
        # max_poll_interval_ms=500,
        enable_auto_commit=False,
        # heartbeat_interval_ms=200,
        group_id='validator-group')
        # value_deserializer=lambda x: loads(x.decode('utf-8')))

    print('Starting deamon on topic:' + topic_name)
    while True:
        consumer.subscribe(topic_name)

        for message in consumer:
            consumer.commit()
            domain = message.value.decode("utf-8")

            consumer.unsubscribe()
            print('domain! : {}'.format(domain))
            time.sleep(10)
            producer = KafkaProducer(bootstrap_servers=['kafka:9092'])
            try:
                request = requests.get("http://" + domain + "/")
                if request.status_code == 200:
                    print('web site exists')

                    producer.send('valid_urls', value=str.encode(domain))
                else:
                    print('Web site does not exist')

                    producer.send('invalid_urls', value=str.encode(domain))
            except requests.exceptions.ConnectionError:
                print('Web site does not exist')
                producer.send('invalid_urls', value=str.encode(domain))

            consumer.resume()
            producer.flush()