FROM nvidia/cuda:12.2.2-devel-ubuntu22.04

WORKDIR /workspace
# Install dependencies
RUN apt update && apt install -y \
    python3 \
    python3-pip \
    git
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y
RUN git clone https://github.com/OlafenwaMoses/ImageAI.git
WORKDIR /workspace/ImageAI
RUN pip3 install -r requirements_gpu.txt
RUN pip install cython pillow>=7.0.0 numpy>=1.18.1 opencv-python>=4.1.2 torch>=1.9.0 --extra-index-url https://download.pytorch.org/whl/cu102 torchvision>=0.10.0 --extra-index-url https://download.pytorch.org/whl/cu102 pytest==7.1.3 tqdm==4.64.1 scipy>=1.7.3 matplotlib>=3.4.3 mock==4.0.3
RUN pip install pycocotools@git+https://github.com/gautamchitnis/cocoapi.git@cocodataset-master#subdirectory=PythonAPI
RUN pip install imageai --upgrade

