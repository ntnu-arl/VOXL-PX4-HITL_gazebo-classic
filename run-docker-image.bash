#!/bin/bash

xhost local:root

docker run --rm -it --net=host --privileged -e DISPLAY=$DISPLAY \
    -v /dev/input:/dev/input:rw \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -v $(pwd):/usr/workspace \
    voxl-gazebo-docker:v1.2
