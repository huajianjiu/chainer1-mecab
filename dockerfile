FROM nvidia/cuda:8.0-cudnn6-devel-ubuntu16.04

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
    python3-dev \
    python3-pip \
    python3-wheel \
    python3-setuptools \
    git \
    g++ \
    make \
    cmake \
    libblas3 \
    libblas-dev \
    language-pack-ja-base \
    language-pack-ja \
    mecab \
    libmecab-dev \
    mecab-ipadic-utf8 \
    && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

RUN CHAINER_BUILD_CHAINERX=1 pip3 install --no-cache-dir 'ideep4py<2.1' chainer==1.24 mecab-python3

ENV LANG=ja_JP.UTF-8

ENTRYPOINT ["/bin/bash"]
