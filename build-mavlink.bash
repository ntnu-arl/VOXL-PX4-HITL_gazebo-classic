#!/bin/bash
#
# Build the mavlink libraries required for gazebo
#

cd mavlink
rm -fR generated
rm -fR development
python3 -m pymavlink.tools.mavgen --lang=C --wire-protocol=2.0 --output=../mavlink-libs/generated/include/mavlink/v2.0 message_definitions/v1.0/common.xml
python3 -m pymavlink.tools.mavgen --lang=C --wire-protocol=2.0 --output=../mavlink-libs/development message_definitions/v1.0/development.xml
cd ..