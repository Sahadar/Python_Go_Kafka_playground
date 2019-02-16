#!/bin/bash

docker build -t playground-workspace-sms .
docker run -it -v "$PWD"."/../":/usr/src/playground -v "$HOME/.aws/":/home/playground/.aws --rm --name playground-sms playground-workspace-sms bash