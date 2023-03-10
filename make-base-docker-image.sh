#!/bin/bash
set -ex

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/" >/dev/null 2>&1 && pwd )"

DOCKER_USER=${1:-'dpar39'}
DOCKER_PASSWORD=${2:-$DOCKER_PASSWORD}
DOCKER_IMAGE="$DOCKER_USER/v3d-base:latest"

docker login -u $DOCKER_USER -p $DOCKER_PASSWORD
docker build -f Dockerfile.base -t $DOCKER_IMAGE $THIS_DIR
docker push $DOCKER_IMAGE