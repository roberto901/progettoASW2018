#!/bin/bash
eval $(minikube docker-env)
docker build -t sentence-service/sentence-service-img .
docker build -t word-service/word-service-img .