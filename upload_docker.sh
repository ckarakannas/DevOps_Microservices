#!/usr/bin/env bash

# Define dockerpath
dockerpath=chrisk14/udacity-ml-api

# Authenticate & tag
docker login
echo "Docker ID and Image: $dockerpath"

# Push image to a docker repository
docker push $dockerpath