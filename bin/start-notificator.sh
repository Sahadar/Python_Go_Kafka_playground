#!/bin/bash
export USERID="$(id -u)"
export GROUPID="$(id -g)"
export TIMEZONE="$(cat /etc/timezone)"
# export DOCKER_API_VERSION=`docker version | grep -P -o "Server.*?API[a-zA-Z:_ ]*\K[0-9\.]*"`

SCRIPTPATH=$(dirname $0)

docker-compose -f "$SCRIPTPATH/docker-compose.yml" stop playground-notificator
docker-compose -f "$SCRIPTPATH/docker-compose.yml" -f "$SCRIPTPATH/docker-compose-notificator.override.yml" up --always-recreate-deps -d playground-notificator

docker exec --user=playground -it playground-notificator bash -l

docker-compose -f "$SCRIPTPATH/docker-compose.yml" stop playground-notificator
docker-compose -f "$SCRIPTPATH/docker-compose.yml" up --always-recreate-deps -d playground-notificator