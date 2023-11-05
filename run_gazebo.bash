#!/bin/bash
#
# Run gazebo in support of voxl2 hitl
#

# setup Gazebo env and update package path
export GAZEBO_PLUGIN_PATH=$GAZEBO_PLUGIN_PATH:$(pwd)
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:$(pwd)/models
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(pwd)/build

echo -e "GAZEBO_PLUGIN_PATH $GAZEBO_PLUGIN_PATH"
echo -e "GAZEBO_MODEL_PATH $GAZEBO_MODEL_PATH"
echo -e "LD_LIBRARY_PATH $LD_LIBRARY_PATH"

gazebo worlds/hitl_iris.world