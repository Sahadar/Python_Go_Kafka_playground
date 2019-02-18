#!/bin/bash

docker build -t playground-workspace-kafka .
docker stop playground-kafka
docker run -it -v "$PWD"."/../":/usr/src/playground -p 9092:9092 -p 2888:2888 -p 3888:3888 -d --rm --name playground-kafka playground-workspace-kafka
./bash.sh