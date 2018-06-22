FROM maven:3-jdk-8
RUN git clone --depth 1 https://github.com/apache/incubator-dubbo-ops.git /source
WORKDIR /source
RUN git rev-parse HEAD
RUN mvn package -f dubbo-admin


FROM java:8
RUN rm -rf /usr/local/tomcat/webapps/
COPY --from=0 /source/dubbo-admin/target/*.jar /app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
EXPOSE 7001
