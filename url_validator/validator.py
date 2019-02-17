import boto3
import random
from kafka import KafkaConsumer
from json import loads

if __name__ == '__main__':
	topic_name = 'urls_to_check'

	consumer = KafkaConsumer(
	    topic_name,
		bootstrap_servers=['kafka:9092'],
		# auto_offset_reset='earliest',
		max_poll_interval_ms=200,
		enable_auto_commit=False,
		heartbeat_interval_ms=100,
		group_id='sms-group')
		# value_deserializer=lambda x: loads(x.decode('utf-8')))

	for message in consumer:
		consumer.commit()
		message = str(message.value)
		print('Message! : {}'.format(message))