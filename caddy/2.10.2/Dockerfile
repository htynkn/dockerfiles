# 1. 定义版本变量，当前最新稳定版为 2.10.2
ARG CADDY_VERSION=2.10.2

# 2. 使用对应版本的 builder 镜像
FROM caddy:${CADDY_VERSION}-builder AS builder

# 3. 编译 Caddy
RUN xcaddy build \
    --with github.com/caddy-dns/alidns

# 4. 生成最终镜像
FROM caddy:${CADDY_VERSION}

# 从 builder 阶段拷贝编译好的二进制文件
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
