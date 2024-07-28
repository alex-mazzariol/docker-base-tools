#!/bin/bash

set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <image-name>"
    exit 1
fi

IMAGE_NAME=$1

docker build -t alexmazzariol/$IMAGE_NAME-rhel8 -f Dockerfile.$IMAGE_NAME .
docker push alexmazzariol/$IMAGE_NAME-rhel8