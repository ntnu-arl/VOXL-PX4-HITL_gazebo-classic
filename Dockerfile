
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
    libgstreamer-plugins-base1.0-dev \
    gnupg2 \
    ninja-build

COPY mavlink/pymavlink/requirements.txt .
RUN python3 -m pip install -r requirements.txt
RUN rm requirements.txt
RUN pip3 install Jinja2
RUN pip3 install numpy

RUN sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable \
    `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'

RUN wget http://packages.osrfoundation.org/gazebo.key

RUN apt-key add gazebo.key

RUN apt-get update -y --quiet

RUN DEBIAN_FRONTEND=noninteractive apt-get -y --quiet --no-install-recommends install \
    gazebo11 \
    libgazebo11-dev

WORKDIR /usr/workspace

