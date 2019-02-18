#!/bin/bash

kafka_2.11-2.1.0/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic $1 --from-beginning
