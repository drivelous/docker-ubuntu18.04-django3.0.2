FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update

RUN apt-get -y install \
    build-essential \
    curl \
    git \
    libssl-dev \
    wget \
    checkinstall \
    zlib1g-dev \
    libreadline-gplv2-dev \
    libncursesw5-dev \
    libsqlite3-dev \
    tk-dev \
    libgdbm-dev \
    libc6-dev \
    libbz2-dev \
    libffi-dev

RUN cd /opt \
    && wget https://www.python.org/ftp/python/3.8.1/Python-3.8.1.tgz \
    && tar xzf Python-3.8.1.tgz \
    && cd Python-3.8.1 \
    && ./configure --enable-optimizations \
    && make altinstall

RUN apt-get -y install python3-pip

RUN cd /usr/local/bin \
    && ln -s /usr/bin/python3 python \
    && pip3 install --upgrade pip

RUN apt-get clean && apt-get update && apt-get install -y locales && locale-gen en_US && locale-gen en_US.UTF-8

RUN mkdir /var/www && mkdir /var/www/app

WORKDIR /var/www/app

COPY requirements.txt /var/www/app

RUN pip install -r requirements.txt

COPY . /var/www/app
