FROM stereolabs/zed:4.0-devel-cuda12.1-ubuntu22.04

# Install dependencies

RUN apt update && apt install git libcuddn8 -y
RUN pip install pyyaml
WORKDIR /usr/local
RUN git clone --recursive https://github.com/pytorch/pytorch
WORKDIR /usr/local/pytorch
RUN git submodule sync && git submodule update --init --recursive

