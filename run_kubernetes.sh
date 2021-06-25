#!/usr/bin/env bash

# Define dockerpath
dockerpath=chrisk14/udacity-ml-api

# Run the Docker Hub container with kubernetes
kubectl run boston-house-price-predictor \
    --image=$dockerpath \
    --port=5000 \
    --labels app=udacity-ml-api

# List kubernetes pods
kubectl get pods

# Sleep for 3mins to allow pod to get up and running
echo "INFO: Going to sleep for 3mins. Allowing pod to run..."
sleep 180

# Forward the container port to a host
kubectl port-forward boston-house-price-predictor 8000:5000
