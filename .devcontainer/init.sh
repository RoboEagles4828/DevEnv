#!/bin/bash
# Pull the actual image so it is saved locally
docker pull ghcr.io/roboeagles4828/developer-environment:6
mkdir -p ~/docker/vscode
# XSOCK=/tmp/.X11-unix
# XAUTH=/tmp/.docker.xauth
# touch $XAUTH
# echo "Display to use: $DISPLAY"
# xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -