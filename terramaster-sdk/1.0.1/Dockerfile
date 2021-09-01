FROM ubuntu:20.04
LABEL maintainer="htynkn@gmail.com"
LABEL Description="[UNOFFICIAL] This image is used to compile and package app for terra-master NAS application" Version="1.0.2"

RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y vim wget doxygen cmake build-essential unzip && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /sdk && wget --keep-session-cookies --user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36" https://dl.terra-master.com/en/TerraMaster_APP_packaging_tool-1.04.zip -O /tmp/package_tool.zip && unzip /tmp/package_tool.zip -d /sdk && mv /sdk/TerraMaster_APP_packaging_tool-* /sdk/packaging_tool && wget --keep-session-cookies --user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36" http://dl.terra-master.com/cn/TerraMaster_TOS_x.86_64_toolchains_1.01.tar.gz -O /tmp/x86_64_sdk.tar.gz && tar -xf /tmp/x86_64_sdk.tar.gz -C /sdk && mv /sdk/builtroot_toolchain /sdk/x86_64_builtroot_toolchain && rm -rf /tmp/*.zip && rm -rf /tmp/*.tar.gz
RUN ln -s /usr/lib/x86_64-linux-gnu/libmpfr.so.6 /usr/lib/x86_64-linux-gnu/libmpfr.so.4

ENV TOS_X86_64_SDK_FOLDER "/sdk/x86_64_builtroot_toolchain"
ENV TOS_PACKAGE_TOOL_FOLDER "/sdk/packaging_tool"
ENV PATH "${TOS_PACKAGE_TOOL_FOLDER}:${PATH}"
