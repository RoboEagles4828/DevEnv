FROM stereolabs/zed:4.0-devel-cuda12.1-ubuntu22.04

# Install dependencies

RUN apt-get update && apt-get install -y \
        sudo \
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

# RUN apt list | grep libcuddn8
ENV cudnn_version=8.9.3.28
ENV cuda_version=cuda12.1

RUN apt-get install libcudnn8=${cudnn_version}-1+${cuda_version}
RUN apt-get install libcudnn8-dev=${cudnn_version}-1+${cuda_version}

RUN apt install git -y
RUN pip install pyyaml
WORKDIR /usr/local
RUN git clone --recursive https://github.com/pytorch/pytorch
WORKDIR /usr/local/pytorch
RUN git submodule sync && git submodule update --init --recursive
RUN python3 setup.py develop

