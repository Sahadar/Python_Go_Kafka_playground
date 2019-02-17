#!/bin/bash

docker build -t playground-workspace-notificator .
docker run -it -v "$PWD"."/../":/usr/src/playground -v "$HOME/.aws/":/home/playground/.aws --rm --name playground-notificator playground-workspace-notificator bash