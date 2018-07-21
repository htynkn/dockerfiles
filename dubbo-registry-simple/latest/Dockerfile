FROM maven:3-jdk-8
RUN git clone --depth 1 https://github.com/apache/incubator-dubbo-ops.git /source
WORKDIR /source
RUN git rev-parse HEAD
RUN mvn package -f dubbo-registry-simple


FROM java:8
RUN apt-get update && apt-get install net-tools

RUN mkdir /apps

COPY --from=0 /source/dubbo-registry-simple/target/*.tar.gz /apps
RUN tar -xvf /apps/dubbo-registry-simple-2.0.0-assembly.tar.gz -C /apps
RUN wget http://central.maven.org/maven2/javax/servlet/servlet-api/2.5/servlet-api-2.5.jar -P /apps/dubbo-registry-simple-2.0.0/lib/
ENTRYPOINT /apps/dubbo-registry-simple-2.0.0/assembly.bin/start.sh && tail -f /apps/dubbo-registry-simple-2.0.0/logs/*

EXPOSE 9090
