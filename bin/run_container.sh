#!/bin/bash

export USERID="$(id -u)"
export GROUPID="$(id -g)"
export TIMEZONE="$(cat /etc/timezone)"

SCRIPTPATH="$PWD/$(dirname $0)/../$1/workspace"

echo $SCRIPTPATH

$SCRIPTPATH/run.sh ${@:2}
#docker build -t playground-workspace-$1 "$SCRIPTPATH/"
#docker stop playground-$1
#docker run -it -v "$SCRIPTPATH/../":/usr/src/playground -p 9092:9092 -p 2888:2888 -p 3888:3888 --rm --name playground-$1 playground-workspace-$1 ${@:2}
