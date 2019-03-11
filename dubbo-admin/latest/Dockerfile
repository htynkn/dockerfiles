FROM maven:3-jdk-8
RUN git clone --depth 1 --single-branch -b develop https://github.com/apache/incubator-dubbo-admin d.git /source
WORKDIR /source
RUN git rev-parse HEAD
RUN mvn clean package -Dmaven.test.skip=true
RUN ls dubbo-admin-distribution/target


FROM openjdk:8-jre
COPY --from=0 /source/dubbo-admin-distribution/target/dubbo-admin-0.1.jar /app.jar
ENTRYPOINT ["java","-XX:+UnlockExperimentalVMOptions","-XX:+UseCGroupMemoryLimitForHeap","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
EXPOSE 8080
HEALTHCHECK --interval=10s --timeout=3s --retries=5 --start-period=120s \
CMD curl --silent --fail http://localhost:8080/swagger-resources || exit 1
