# Use an official Python runtime as a parent image
FROM python:3.10.8-slim-bullseye

# Set the working directory
WORKDIR /app

# Copy the src directory contents into the container at /app
COPY ./src /app

# Copy the .env file into the container
COPY .env /app/.env

# Install any needed packages specified in install.sh
RUN chmod +x /app/install.sh
RUN /app/install.sh

# Make ports 80 and 8404 available to the world outside this container
EXPOSE 80 8404

# Run FastAPI and HAProxy
CMD ["bash", "-c", "source /app/.env && uvicorn fastapi-app:app --host 0.0.0.0 --port 8000 & haproxy -f /app/haproxy.cfg"]