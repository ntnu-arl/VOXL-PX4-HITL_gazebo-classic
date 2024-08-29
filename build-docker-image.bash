#!/bin/bash

# The no cache option will force everything to be rebuilt from scratch
# docker build --no-cache -t voxl-gazebo-docker:v1.2 .

docker build --no-cache -t voxl-gazebo-docker:v1.2 .
docker tag voxl-gazebo-docker:v1.2 voxl-gazebo-docker:latest

