FROM devkitpro/devkita64:latest

ENV HOME /root

RUN apt-get update && apt-get install -y llvm build-essential clang cmake && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain stable -y
ENV PATH /root/.cargo/bin:$PATH
RUN cd /root/.cargo/bin && cargo install xargo cargo-xbuild && rustup default nightly && rustup component add rust-src
