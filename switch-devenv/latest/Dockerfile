FROM devkitpro/devkita64:latest

RUN dkp-pacman -S switch-dev switch-libconfig switch-curl switch-sdl2 switch-sdl2_ttf switch-sdl2_image switch-sdl2_gfx switch-sdl2_mixer switch-mesa switch-glad switch-glm switch-libdrm_nouveau switch-libwebp switch-libpng switch-freetype switch-bzip2 switch-libjpeg-turbo switch-opusfile switch-libopus --noconfirm
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
RUN rustup default nightly
