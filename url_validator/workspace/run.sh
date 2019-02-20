#!/bin/bash

export USERID="$(id -u)"
export GROUPID="$(id -g)"
export TIMEZONE="$(cat /etc/timezone)"

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

docker build -t playground-workspace-validator "$SCRIPTPATH/"
docker stop playground-validator
docker run -it -v "$SCRIPTPATH/../":/usr/src/playground -v "$HOME/.aws/":/home/playground/.aws --link=playground-kafka:kafka --rm --name playground-validator playground-workspace-validator bash