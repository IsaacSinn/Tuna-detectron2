FROM python:3.8-slim-buster

RUN apt-get update -y

# gcc compiler and opencv prerequisites
RUN apt-get -y install nano git build-essential libglib2.0-0 libsm6 libxext6 libxrender-dev

# Detectron2 prerequisites
# RUN pip install pytorch==1.9.0 torchvision==0.10.0 torchaudio cudatoolkit=11.1 -c pytorch
RUN pip install torch==1.10.0+cu113 torchvision==0.11.1+cu113 torchaudio==0.10.0+cu113 -f https://download.pytorch.org/whl/cu113/torch_stable.htm



RUN pip install cython
# RUN pip install -U 'git+https://github.com/cocodataset/cocoapi.git#subdirectory=PythonAPI'

# Detectron2
RUN python -m pip install detectron2 -f https://dl.fbaipublicfiles.com/detectron2/wheels/cu113/torch1.10/index.html
# RUN git clone https://github.com/facebookresearch/detectron2.git
# RUN python -m pip install -e detectron2

# Development packages
RUN pip install flask flask-cors requests opencv-python
