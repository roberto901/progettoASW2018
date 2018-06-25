#!/bin/bash
eval $(minikube docker-env)
docker build -t sentence-service-img sentence-service
docker build -t word-service-img word-service
