import boto3
import random

sns = boto3.client('sns')

randomNumber = random.randint(1,101)

sns.publish(PhoneNumber = number, Message='Test message with random number: ' + str(randomNumber),
	MessageAttributes = {
		'AWS.SNS.SMS.SenderID' : {
			'DataType' : 'String',
			'StringValue' : 'Sahadar'
			}
	}
);
