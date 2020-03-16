FROM consol/ubuntu-xfce-vnc:1.4.0


USER 0

RUN apt-get update && apt-get install -y xz-utils build-essential libboost-all-dev cmake python2 clang libc++-dev qtbase5-dev libqt5opengl5-dev libsdl2-2.0-0 libsdl2-dev
RUN wget https://github.com/yuzu-emu/yuzu-mainline/releases/download/mainline-0-197/yuzu-linux-20200315-ea8828986.tar.xz -O yuzu-linux.tar.xz


USER 1000
EXPOSE 5901 6901