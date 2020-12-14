FROM ubuntu:18.04
RUN apt update && apt install -y vim wget build-essential unzip
RUN mkdir -p /sdk && wget http://dl.terra-master.com/cn/TerraMaster_APP_packaging_tool-1.03.zip -O /tmp/package_tool.zip && unzip /tmp/package_tool.zip -d /sdk && mv /sdk/TerraMaster_APP_packaging_tool-* /sdk/packaging_tool
RUN wget http://dl.terra-master.com/cn/TerraMaster_TOS_x.86_64_toolchains_1.01.tar.gz -O /tmp/x86_64_sdk.tar.gz && tar -xf /tmp/x86_64_sdk.tar.gz -C /sdk && mv /sdk/builtroot_toolchain /sdk/x86_64_builtroot_toolchain

ENV TOS_X86_64_SDK_FOLDER = "/sdk/x86_64_builtroot_toolchain"
ENV TOS_PACKAGE_TOOL_FOLDER = "/sdk/packaging_tool"
ENV PATH="${TOS_PACKAGE_TOOL_FOLDER}:${PATH}"

RUN rm -rf /tmp/*.zip && rm -rf /tmp/*.tar.gz