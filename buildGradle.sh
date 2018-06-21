#!/bin/bash
eval $(minikube docker-env)
gradle build -t sentence-service/build.gradle
gradle build -t word-service/build.gradle
