#!/bin/bash

export USERID="$(id -u)"
export GROUPID="$(id -g)"
export TIMEZONE="$(cat /etc/timezone)"

SCRIPTPATH=$(dirname $0)

"$SCRIPTPATH/stop.sh"
docker-compose -f "$SCRIPTPATH/docker-compose.yml" build