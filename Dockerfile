
FROM ubuntu:20.04

RUN apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --quiet --no-install-recommends install \
    gcc \
    g++ \
    make \
    cmake \
    git \
    libboost-all-dev \
    lsb-release \
    sudo \
    wget \
    python3-pip \
    libopencv-dev \
    libgstreamer-plugins-base1.0-dev

# RUN python3 -m pip install -r mavlink/pymavlink/requirements.txt

RUN sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable \
    `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'

RUN wget http://packages.osrfoundation.org/gazebo.key

RUN DEBIAN_FRONTEND=noninteractive apt-get -y --quiet --no-install-recommends install gnupg2

RUN apt-key add gazebo.key

RUN apt-get update -y --quiet

RUN DEBIAN_FRONTEND=noninteractive apt-get -y --quiet --no-install-recommends install \
    gazebo11 \
    libgazebo11-dev

WORKDIR /usr/workspace

