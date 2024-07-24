FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y curl \
    wget \
    locales \
    tzdata \
    git \
    mingw-w64 \
    gcc \
    libusb-dev

RUN wget https://apt.kitware.com/kitware-archive.sh &&\
    bash kitware-archive.sh && \
    rm -rf kitware-archive.sh


RUN apt install -y --no-install-recommends git cmake ninja-build gperf \
    ccache dfu-util device-tree-compiler wget \
    python3-dev python3-pip python3-setuptools python3-tk python3-wheel xz-utils file \
    make gcc gcc-multilib g++-multilib libsdl2-dev libmagic1

RUN pip install west

RUN west init /home/user/zephyrproject 

WORKDIR /home/user/zephyrproject
RUN west update

RUN west zephyr-export

RUN pip install -r /home/user/zephyrproject/zephyr/scripts/requirements.txt

WORKDIR /home/user
RUN wget https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v0.16.5-1/zephyr-sdk-0.16.5-1_linux-x86_64.tar.xz && \
wget -O - https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v0.16.5-1/sha256.sum | shasum --check --ignore-missing

RUN tar xvf zephyr-sdk-0.16.5-1_linux-x86_64.tar.xz

WORKDIR  /home/user/zephyr-sdk-0.16.5-1
    
# RUN ls -la && chmod +x setup.sh && bash setup.sh

RUN printf "y\ny\n" | ./setup.sh

WORKDIR /home/user/zephyrproject/zephyr

RUN west build -p always -b teensy40 samples/basic/blinky

RUN apt-get update && \
    apt-get install -y git \
    mingw-w64 \
    gcc \
    libusb-dev

WORKDIR /home/user/

RUN git clone https://github.com/PaulStoffregen/teensy_loader_cli.git

WORKDIR /home/user/teensy_loader_cli

RUN make

ENV PATH="/home/user/teensy_loader_cli:${PATH}"
