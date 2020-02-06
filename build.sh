#!/bin/bash
TAG=1.0
pwd
echo 'Start build spring application'
mvn clean install
echo 'Build spring application successfully'

echo 'Start build docker image'
docker build -t spring-app:$TAG .
echo 'Build docker image successfully'

echo 'Start run docker image'
winpty docker container run -it -p 8080:8080 --name spring-app spring-app:$TAG
echo 'Run docker image successfully'