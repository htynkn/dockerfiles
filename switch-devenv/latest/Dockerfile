FROM ubuntu:18.04

RUN apt-get update && apt-get install git wget libxml2 libstdc++6 gpg xz-utils make -y && wget https://github.com/devkitPro/pacman/releases/download/devkitpro-pacman-1.0.1/devkitpro-pacman.deb
RUN dpkg -i devkitpro-pacman.deb && dkp-pacman -S switch-dev switch-sdl2 switch-sdl2_ttf switch-sdl2_image switch-sdl2_gfx switch-sdl2_mixer switch-mesa switch-glad switch-glm switch-libdrm_nouveau switch-libwebp switch-libpng switch-freetype switch-bzip2 switch-libjpeg-turbo switch-opusfile switch-libopus --noconfirm && rm devkitpro-pacman.deb

ENV DEVKITPRO="/opt/devkitpro"
ENV DEVKITARM="${DEVKITPRO}/devkitARM"
ENV DEVKITPPC="${DEVKITPRO}/devkitPPC"
ENV PATH="${DEVKITPRO}/tools/bin:$PATH"