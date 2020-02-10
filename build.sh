#!/bin/bash
TAG=1.0
pwd

echo 'Start run docker image'
winpty docker container run -it -p 8080:8080 --name rest-api rest-api:$TAG
echo 'Run docker image successfully'