#!/bin/bash

cd /usr/src/playground/confluent-5.1.1

bin/zookeeper-server-start -daemon etc/kafka/zookeeper.properties
bin/kafka-server-start etc/kafka/server.properties
