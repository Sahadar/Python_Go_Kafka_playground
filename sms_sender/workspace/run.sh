#!/bin/bash

docker build -t playground-workspace .
docker run -it -v "$PWD"."/../":/usr/src/playground -v "$HOME/.aws/":/home/playground/.aws --rm --name playground playground-workspace bash