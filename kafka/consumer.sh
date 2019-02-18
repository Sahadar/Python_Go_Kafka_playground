#!/bin/bash

confluent-5.1.1/bin/kafka-console-consumer --bootstrap-server localhost:9092 --topic $@
