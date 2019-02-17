#!/bin/bash

export USERID="$(id -u)"
export GROUPID="$(id -g)"
export TIMEZONE="$(cat /etc/timezone)"

SCRIPTPATH=$(dirname $0)

docker-compose -f "$SCRIPTPATH/docker-compose.yml" stop
docker-compose -f "$SCRIPTPATH/docker-compose.yml" rm -f