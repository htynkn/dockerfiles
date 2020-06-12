FROM devkitpro/devkita64:latest

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH $HOME/.cargo/bin:$PATH
RUN ls $HOME/
RUN cd $HOME/.cargo/bin && cargo install xargo && rustup default nightly
RUN bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
