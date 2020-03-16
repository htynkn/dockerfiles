FROM centminmod/docker-ubuntu-vnc-desktop:latest

RUN apt-get update && apt-get install -qq -y sudo xz-utils build-essential libboost-all-dev cmake clang libc++-dev qtbase5-dev libqt5opengl5-dev libsdl2-2.0-0 libsdl2-dev
RUN wget https://github.com/yuzu-emu/yuzu-mainline/releases/download/mainline-0-197/yuzu-linux-20200315-ea8828986.tar.xz -O yuzu-linux.tar.xz && mkdir yuzu && tar xf yuzu-linux.tar.xz -C ./yuzu
RUN wget https://www.openssl.org/source/openssl-1.1.1a.tar.gz && tar -zxf openssl-1.1.1a.tar.gz && cd openssl-1.1.1a && ./config && make install && ln -sf /usr/local/bin/openssl /usr/bin/openssl

EXPOSE 80 5900