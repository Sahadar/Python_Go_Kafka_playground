#!/bin/bash
export USERID="$(id -u)"
export GROUPID="$(id -g)"
export TIMEZONE="$(cat /etc/timezone)"
# export DOCKER_API_VERSION=`docker version | grep -P -o "Server.*?API[a-zA-Z:_ ]*\K[0-9\.]*"`

SCRIPTPATH=$(dirname $0)

docker-compose -f "$SCRIPTPATH/docker-compose.yml" stop playground-validator
docker-compose -f "$SCRIPTPATH/docker-compose.yml" -f "$SCRIPTPATH/docker-compose-validator.override.yml" up --always-recreate-deps -d playground-validator

docker exec --user=playground -it playground-validator bash -l

docker-compose -f "$SCRIPTPATH/docker-compose.yml" stop playground-validator
docker-compose -f "$SCRIPTPATH/docker-compose.yml" up --always-recreate-deps -d playground-validator