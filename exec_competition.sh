#!/bin/bash

docker start hmcl_competition

docker exec \
    -it \
    --user autoware \
    hmcl_competition \
    /bin/bash

