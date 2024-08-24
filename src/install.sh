#!/bin/bash

# Update package list and install dependencies
apt update
apt install -y haproxy

# Install FastAPI and Uvicorn
pip install fastapi uvicorn