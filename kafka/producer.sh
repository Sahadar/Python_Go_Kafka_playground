#!/bin/bash

confluent-5.1.1/bin/kafka-console-producer --broker-list localhost:9092 --topic $@
