#!/bin/bash

docker build -t playground-workspace-kafka .
docker stop playground-kafka
docker run -it -v "$PWD"."/../":/usr/src/playground -d --rm --name playground-kafka playground-workspace-kafka
./bash.sh