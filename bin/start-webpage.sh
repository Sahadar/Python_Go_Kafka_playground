#!/bin/bash
export USERID="$(id -u)"
export GROUPID="$(id -g)"
export TIMEZONE="$(cat /etc/timezone)"
# export DOCKER_API_VERSION=`docker version | grep -P -o "Server.*?API[a-zA-Z:_ ]*\K[0-9\.]*"`

SCRIPTPATH=$(dirname $0)

docker-compose -f "$SCRIPTPATH/docker-compose.yml" stop playground-webpage
docker-compose -f "$SCRIPTPATH/docker-compose.yml" -f "$SCRIPTPATH/docker-compose-webpage.override.yml" up --remove-orphans --always-recreate-deps -d playground-webpage

docker exec --user=playground -it playground-webpage bash -l

docker-compose -f "$SCRIPTPATH/docker-compose.yml" stop playground-webpage
docker-compose -f "$SCRIPTPATH/docker-compose.yml" up --remove-orphans --always-recreate-deps -d playground-webpage