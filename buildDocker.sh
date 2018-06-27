#!/bin/bash
eval $(minikube docker-env)

docker build --rm -t sentence-service-img ./sentence-service
docker build --rm -t word-service-img ./word-service
