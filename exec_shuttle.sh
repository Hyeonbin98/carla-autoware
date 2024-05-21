#!/bin/bash

docker start unist_shuttle

docker exec \
    -it \
    --user autoware \
    unist_shuttle \
    /bin/bash

