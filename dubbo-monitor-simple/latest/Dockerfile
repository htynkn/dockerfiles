FROM maven:3-jdk-8
RUN git clone --depth 1 https://github.com/apache/incubator-dubbo-ops.git /source
WORKDIR /source
RUN git rev-parse HEAD
RUN mvn package -f dubbo-monitor-simple


FROM java:8
RUN apt-get update && apt-get install net-tools

RUN mkdir /apps
COPY --from=0 /source/dubbo-monitor-simple/target/*.tar.gz /apps
RUN tar -xvf /apps/dubbo-monitor-simple-2.0.0-assembly.tar.gz
RUN wget http://central.maven.org/maven2/javax/servlet/servlet-api/2.5/servlet-api-2.5.jar /dubbo-monitor-simple-2.0.0/lib/servlet-api-2.5.jar
ENTRYPOINT dubbo-monitor-simple-2.0.0/assembly.bin/start.sh

EXPOSE 8080
