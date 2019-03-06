FROM maven:3-jdk-8
RUN git clone --depth 1 --single-branch -b develop https://github.com/apache/incubator-dubbo-ops.git /source
WORKDIR /source
RUN git rev-parse HEAD
RUN mvn clean package -Dmaven.test.skip=true
RUN ls dubbo-admin-distribution/target


FROM openjdk:8-jre
COPY --from=0 /source/dubbo-admin-distribution/target/dubbo-admin-0.1.jar /app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
EXPOSE 8080
