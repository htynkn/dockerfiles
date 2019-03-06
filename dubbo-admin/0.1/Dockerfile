FROM maven:3-jdk-8
RUN mkdir /source && wget https://github.com/apache/incubator-dubbo-ops/archive/0.1.zip && unzip 0.1.zip -d /source
WORKDIR /source/incubator-dubbo-ops-0.1
RUN mvn clean package -Dmaven.test.skip=true

FROM openjdk:8-jre
COPY --from=0 /source/incubator-dubbo-ops-0.1/dubbo-admin-distribution/target/dubbo-admin-0.1.jar /app.jar
ENTRYPOINT ["java","-XX:+UnlockExperimentalVMOptions","-XX:+UseCGroupMemoryLimitForHeap","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
EXPOSE 8080