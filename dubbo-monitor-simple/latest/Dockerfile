FROM maven:3-jdk-8
RUN git clone --depth 1 https://github.com/apache/incubator-dubbo-ops.git /source
WORKDIR /source
RUN git rev-parse HEAD
RUN mvn package -f dubbo-monitor-simple


FROM java:8
RUN apt-get update && apt-get install net-tools

RUN mkdir /apps && mkdir -p ~/monitor/charts && mkdir -p ~/monitor/statistics

COPY --from=0 /source/dubbo-monitor-simple/target/*.tar.gz /apps
RUN tar -xvf /apps/dubbo-monitor-simple-2.0.0-assembly.tar.gz -C /apps
RUN wget http://central.maven.org/maven2/javax/servlet/servlet-api/2.5/servlet-api-2.5.jar -P /apps/dubbo-monitor-simple-2.0.0/lib/
ENTRYPOINT /apps/dubbo-monitor-simple-2.0.0/assembly.bin/start.sh && tail -f /apps/dubbo-monitor-simple-2.0.0/logs/*

EXPOSE 7070
EXPOSE 8080
