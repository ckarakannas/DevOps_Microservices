#!/usr/bin/env bash

# Run Docker locally

# Build image and add a descriptive tag
docker build -t chrisk14/udacity-ml-api .

# List docker images
docker image ls

# Run flask app
docker run -p 8000:5000 chrisk14/udacity-ml-api