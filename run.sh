#!/bin/bash

xhost +

docker run -ti --rm \
       -e DISPLAY=$DISPLAY \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -v /home/vlbl/arduino-volume:/home/vlbl \
       arduino 

#       -v /dev/ttyUSB0:/dev/ttyUSB0 \
