FROM ubuntu:22.04
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get install -y curl
RUN curl -s https://install.husarnet.com/install.sh | bash

# python3 -m http.server is an example app here
# Feel free to use any method of running husarnet-daemon, but make sure it
# actually runs in the background (you can even use supervisord for that)
# SHELL ["bash", "-c"]
# CMD (husarnet-daemon &) && python3 -m http.server --bind ::

# If you want to suppress the logs from Husarnet
# (equivalent to running Husarnet without HUSARNET_DEBUG)
SHELL ["bash", "-c"]
CMD (husarnet-daemon 2>/dev/null &) && python3 -m http.server --bind ::