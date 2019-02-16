#!/bin/bash

docker build -t playground-workspace-kafka .
docker run -it -v "$PWD"."/../":/usr/src/playground --rm --name playground-kafka playground-workspace-kafka bash