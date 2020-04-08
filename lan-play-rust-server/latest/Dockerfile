FROM rust:1

RUN wget https://github.com/spacemeowx2/slp-server-rust/releases/download/v2.0.0-rust.alpha.4/slp-server-rust-linux-amd64 -O /app && chmod +x /app


EXPOSE 11451/tcp 11451/udp

ENTRYPOINT /app --port 11451
