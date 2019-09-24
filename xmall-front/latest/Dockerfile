FROM node:8
RUN git clone --depth=1 https://github.com/Exrick/xmall-front.git
WORKDIR xmall-front
RUN npm install && npm run build

FROM abiosoft/caddy:1.0.3
COPY --from=0 /xmall-front/dist /srv
ADD Caddyfile /etc/Caddyfile
EXPOSE 8080
