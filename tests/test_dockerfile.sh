#!/usr/bin/env bash

# Exit immediately if any command fails
set -e

echo "=== Starting Dockerfile & Image Tests ==="

IMAGE_NAME="node-express-test-image"

# Setup: Build the Docker image directly from the Dockerfile
echo "Building Docker image..."
docker build -t $IMAGE_NAME .

# Test 1: Verify that the working directory inside the container is correct
echo "Test 1: Verifying working directory inside container..."
WORKDIR=$(docker run --rm $IMAGE_NAME node -p "process.cwd()")
if [ "$WORKDIR" = "/usr/src/app" ] || [ "$WORKDIR" = "/app" ]; then
    echo "SUCCESS: Working directory is correct ($WORKDIR)"
else
    echo "FAILURE: Unexpected working directory: $WORKDIR"
    exit 1
fi

# Test 2: Verify that Node.js is installed and accessible inside the container
echo "Test 2: Verifying Node.js installation..."
NODE_VERSION=$(docker run --rm $IMAGE_NAME node -v)
if [[ "$NODE_VERSION" == v* ]]; then
    echo "SUCCESS: Node.js is installed ($NODE_VERSION)"
else
    echo "FAILURE: Node.js not found or invalid version."
    exit 1
fi

# Teardown: Clean up the test Docker image
echo "Cleaning up test image..."
docker rmi $IMAGE_NAME

echo "=== All Shell Assert Tests Passed Successfully! ==="