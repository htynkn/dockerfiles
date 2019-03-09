FROM maven:3-jdk-8
RUN git clone --depth 1 https://github.com/Meituan-Dianping/Leaf.git /source
WORKDIR /source
RUN git rev-parse HEAD
ADD leaf.properties /source/leaf-server/src/main/resources/leaf.properties
RUN mvn clean install -DskipTests

FROM openjdk:8-jre
COPY --from=0 /source /app
WORKDIR /app/leaf-server
ENTRYPOINT ["/bin/bash", "deploy/run.sh"]
EXPOSE 8080