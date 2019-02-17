import boto3
import random
from kafka import KafkaConsumer
from json import loads

def send_sms():
	sns = boto3.client('sns')

	number = '+48xxxxxxxxx';

	randomNumber = random.randint(1,101)

	print('SMS SEND!')
	# sns.publish(PhoneNumber = number, Message='Test message with random number: ' + str(randomNumber),
	# 	MessageAttributes = {
	# 		'AWS.SNS.SMS.SenderID' : {
	# 			'DataType' : 'String',
	# 			'StringValue' : 'Sahadar'
	# 			}
	# 	}
	# );


if __name__ == '__main__':
	topic_name = 'valid_urls'

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
		message = message.value
		print('Message! : {}'.format(message))
		consumer.commit()