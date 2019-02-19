#!/bin/bash

export USERID="$(id -u)"
export GROUPID="$(id -g)"
export TIMEZONE="$(cat /etc/timezone)"

SCRIPTPATH="$PWD/$(dirname $0)"

docker build -t playground-workspace-kafka "$SCRIPTPATH/"
docker stop playground-kafka
docker run -it -v "$SCRIPTPATH/../":/usr/src/playground -p 9092:9092 -p 2888:2888 -p 3888:3888 --rm --name playground-kafka playground-workspace-kafka $@