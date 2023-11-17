#!/bin/bash

# The no cache option will force everything to be rebuilt from scratch
# docker build --no-cache -t voxl-gazebo-docker:v1.1 .

docker build -t voxl-gazebo-docker:v1.1 .

