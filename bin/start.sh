#!/bin/bash

export USERID="$(id -u)"
export GROUPID="$(id -g)"
export TIMEZONE="$(cat /etc/timezone)"

SCRIPTPATH=$(dirname $0)

"$SCRIPTPATH/stop.sh"
"$SCRIPTPATH/build.sh"

docker-compose -f "$SCRIPTPATH/docker-compose.yml" up --remove-orphans -d --force-recreate

"$SCRIPTPATH/bash.sh"