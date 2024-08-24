#!/bin/bash

# Build the Docker image
docker build -t haproxy-sample .

# Run the Docker container with environment variables
docker container run -it --name haproxy-sample --rm --env-file .env -p 80:80 -p 8404:8404 haproxy-sample