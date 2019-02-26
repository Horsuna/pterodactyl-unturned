FROM debian:jessie

MAINTAINER Raf T, <rafisfat1@protonmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN dpkg --add-architecture i386 && \
    apt update && \
    apt upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata && \
    apt install -y curl screen htop unzip lib32stdc++6 mono-runtime libc6:i386 libgl1-mesa-glx:i386 libxcursor1:i386 libxrandr2:i386 libc6-dev-i386 libgcc-4.8-dev:i386 && \
    useradd -d /home/container -m container && \
    apt -y --no-install-recommends install build-essential gcc-multilib rpm libstdc++6:i386 libgcc1:i386 zlib1g:i386 libncurses5:i386 && \
    apt -y --no-install-recommends install mono-runtime && \
    apt -y --no-install-recommends install libc6:i386 libgl1-mesa-glx:i386 libxcursor1:i386 libxrandr2:i386 && \ 
    apt -y --no-install-recommends install gdb libmono2.0-cil && \
    apt -y --no-install-recommends install g++ gcc make tar unzip
    
    
USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
