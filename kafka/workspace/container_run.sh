#!/bin/bash

cd /usr/src/playground/kafka_2.11-2.1.0

bin/zookeeper-server-start.sh -daemon config/zookeeper.properties
bin/kafka-server-start.sh config/server.properties