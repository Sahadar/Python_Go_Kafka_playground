#!/bin/bash

docker build -t playground-workspace-webpage .
docker run -it -v "$PWD"."/../":/usr/src/playground -v "$HOME/.aws/":/home/playground/.aws --rm --name playground-webpage playground-workspace-webpage bash