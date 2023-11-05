#!/bin/bash

docker run -it --rm --privileged --net=host -v $(pwd):/usr/workspace voxl-gazebo-docker:v1.0