FROM tomcat:8.0-jre8-alpine
RUN apk add mysql-client
RUN mkdir /data && chmod 777 /data/ -R && mkdir -p /data/appdatas/cat/ && mkdir /app
COPY script/*.xml /data/appdatas/cat/
COPY script/Cat.sql /app
COPY script/entrypoint.sh /app
RUN chmod +x /app/*.sh
ENTRYPOINT /app/entrypoint.sh