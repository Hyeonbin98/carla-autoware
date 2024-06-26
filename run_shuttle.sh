#!/bin/bash

RUNTIME=""
DOCKER_VERSION=$(docker version --format '{{.Client.Version}}' | cut --delimiter=. --fields=1,2)
if [[ $DOCKER_VERSION < "19.03" ]] && ! type nvidia-docker; then
    RUNTIME="--gpus all"
else
    RUNTIME="--runtime=nvidia"
fi

docker run \
    -it \
    --volume=$(pwd)/autoware-contents:/home/autoware/autoware-contents:ro \
    --env="DISPLAY=${DISPLAY}" \
    --privileged \
    --net=host \
    --name=unist_shuttle \
    $RUNTIME \
    bin2915/carla-autoware:shuttle

