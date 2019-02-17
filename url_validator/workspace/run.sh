#!/bin/bash

docker build -t playground-workspace-validator .
docker run -it -v "$PWD"."/../":/usr/src/playground -v "$HOME/.aws/":/home/playground/.aws --rm --name playground-validator playground-workspace-validator bash