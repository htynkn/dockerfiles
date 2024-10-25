FROM mcr.microsoft.com/devcontainers/base:jammy
RUN curl -sS "https://virtuslab.github.io/scala-cli-packages/KEY.gpg" | sudo gpg --dearmor  -o /etc/apt/trusted.gpg.d/scala-cli.gpg 2>/dev/null
RUN curl -s --compressed -o /etc/apt/sources.list.d/scala_cli_packages.list "https://virtuslab.github.io/scala-cli-packages/debian/scala_cli_packages.list"
RUN wget -qO - https://packages.adoptium.net/artifactory/api/gpg/key/public | gpg --dearmor | tee /etc/apt/trusted.gpg.d/adoptium.gpg > /dev/null
RUN echo "deb https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list
RUN apt update && apt install scala-cli temurin-17-jdk wget gpg apt-transport-https -y
RUN curl -L https://raw.githubusercontent.com/lefou/millw/0.4.11/millw > mill && chmod +x mill && mv mill /usr/local/bin/
RUN curl -s -L https://github.com/sbt/sbt/releases/download/v1.9.7/sbt-1.9.7.tgz | tar xz && mv sbt/bin/sbt /usr/local/bin/
RUN apt install -y git help2man perl python3 make autoconf g++ flex bison ccache libgoogle-perftools-dev numactl perl-doc libfl2 libfl-dev zlib1g zlib1g-dev
RUN cd /tmp && git clone https://github.com/verilator/verilator  && cd verilator && \
    git pull && \
    git checkout v5.022 && \
    autoconf && ./configure && \
    make -j `nproc` && \
    make install
