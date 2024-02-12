
FROM ubuntu:20.04

RUN apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --quiet --no-install-recommends install \
    gcc \
    g++ \
    make \
    cmake \
    vim \
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

# This will update if there have been any updates to the voxl-dev branch and force a new git clone
ADD https://api.github.com/repos/modalai/PX4-SITL_gazebo-classic/git/refs/heads/voxl-dev version.json

RUN git clone https://github.com/modalai/PX4-SITL_gazebo-classic.git voxl2_hitl_gazebo

WORKDIR /usr/workspace/voxl2_hitl_gazebo
RUN git checkout voxl-dev
RUN git submodule update --init --recursive

RUN python3 -m pip install -r mavlink/pymavlink/requirements.txt


RUN mkdir -p mavlink-libs

WORKDIR /usr/workspace/voxl2_hitl_gazebo/mavlink
RUN python3 -m pymavlink.tools.mavgen --lang=C --wire-protocol=2.0 --output=../mavlink-libs/generated/include/mavlink/v2.0 message_definitions/v1.0/common.xml
RUN python3 -m pymavlink.tools.mavgen --lang=C --wire-protocol=2.0 --output=../mavlink-libs/development message_definitions/v1.0/development.xml

WORKDIR /usr/workspace/voxl2_hitl_gazebo/build
RUN cmake ..
RUN make -j2
RUN make install

WORKDIR /usr/workspace/voxl2_hitl_gazebo



