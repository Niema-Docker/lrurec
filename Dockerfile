# Minimal Docker image for LRURec using PyTorch base
FROM pytorch/pytorch:2.9.1-cuda13.0-cudnn9-runtime
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install LRURec
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y git && \
    pip install --no-cache-dir --upgrade numpy pandas pytorch_lightning wandb && \
    git clone https://github.com/yueqirex/LRURec.git && \
    mv LRURec /usr/local/bin/LRURec && \
    echo "alias lrurec_train='python /usr/local/bin/LRURec/train.py'" >> ~/.bashrc && \
    rm -rf /root/.cache /tmp/*
