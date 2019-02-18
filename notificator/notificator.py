import boto3
import random
from kafka import KafkaConsumer
from json import loads

def send_sms(domain):
	sns = boto3.client('sns')

	number = '+48xxxxxxxxx';

	sns.publish(PhoneNumber = number, Message='Invalid domain: ' + domain,
		MessageAttributes = {
			'AWS.SNS.SMS.SenderID' : {
				'DataType' : 'String',
				'StringValue' : 'BudgetGuard'
				}
		}
	);


if __name__ == '__main__':
	topic_name = 'invalid_urls'

	consumer = KafkaConsumer(
	    topic_name,
		bootstrap_servers=['kafka:9092'],
		# auto_offset_reset='earliest',
        # max_poll_interval_ms=500,
        enable_auto_commit=False,
        # heartbeat_interval_ms=200,
		group_id='notificator-group')
		# value_deserializer=lambda x: loads(x.decode('utf-8')))

	for message in consumer:
		consumer.commit()
		domain = message.value.decode("utf-8")

		print('SMS SEND!')
		# send_sms(domain)