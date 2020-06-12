FROM devkitpro/devkita64:latest

RUN curl https://sh.rustup.rs -sSf | sh
ENV PATH $HOME/.cargo/bin:$PATH
RUN ls $HOME/
RUN cd $HOME/.cargo/bin && cargo install xargo && rustup default nightly
RUN bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
