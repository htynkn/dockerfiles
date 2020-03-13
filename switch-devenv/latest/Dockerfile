FROM ubuntu:18.04
RUN apt-get git wget install libxml2 libstdc++6 gpg xz-utils make -y && wget https://github.com/devkitPro/pacman/releases/download/devkitpro-pacman-1.0.1/devkitpro-pacman.deb
RUN dpkg -i devkitpro-pacman.deb && dkp-pacman -S switch-dev --noconfirm
RUN source /etc/profile.d/devkit-env.sh