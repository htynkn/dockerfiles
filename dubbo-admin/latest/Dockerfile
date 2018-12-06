FROM maven:3-jdk-8
RUN git clone --depth 1 --single-branch -b develop https://github.com/apache/incubator-dubbo-ops.git /source
WORKDIR /source
RUN git rev-parse HEAD
RUN mvn clean package
RUN ls /dubbo-admin-backend/target


FROM java:8
RUN rm -rf /usr/local/tomcat/webapps/
COPY --from=0 /source/dubbo-admin-backend/target/*.jar /app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
EXPOSE 8080
