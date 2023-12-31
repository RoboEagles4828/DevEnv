FROM stereolabs/zed:4.0-devel-cuda11.8-ubuntu22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
        sudo \
        wget \
        git \
        software-properties-common \
&& rm -rf /var/lib/apt/lists/* \
&& apt-get clean
# Install libcudnn8
ENV OS=ubuntu2204

RUN wget https://developer.download.nvidia.com/compute/cuda/repos/${OS}/x86_64/cuda-${OS}.pin

RUN mv cuda-${OS}.pin /etc/apt/preferences.d/cuda-repository-pin-600
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/${OS}/x86_64/7fa2af80.pub
RUN add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/${OS}/x86_64/ /"
RUN apt-get update
ENV cudnn_version=8.9.3.28
ENV cuda_version=cuda11.8

RUN apt-get install libcudnn8=${cudnn_version}-1+${cuda_version}
RUN pip install pyyaml
WORKDIR /usr/local
RUN git clone --recursive https://github.com/pytorch/pytorch
WORKDIR /usr/local/pytorch
RUN git submodule sync && git submodule update --init --recursive
RUN python3 setup.py develop
WORKDIR /usr/local
RUN git clone https://github.com/pytorch/vision.git
WORKDIR /usr/local/vision
RUN python3 setup.py develop
WORKDIR /usr/local
RUN git clone https://github.com/ultralytics/ultralytics
WORKDIR /usr/local/ultralytics
RUN sed -i 's/torch>=1.7.0/# torch>=1.7.0/g' requirements.txt
RUN sed -i 's/torchvision>=0.8.1/# torchvision>=0.8.1/g' requirements.txt
RUN pip install -e .
WORKDIR /usr/local

