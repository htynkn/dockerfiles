FROM maven:3-jdk-7
RUN git clone --depth 1 https://github.com/dianping/cat.git /source
WORKDIR /source
RUN mvn clean install -DskipTests
RUN ls cat-home/target

FROM tomcat:7
RUN rm -rf /usr/local/tomcat/webapps/**
COPY --from=0 /source/cat-home/target/*.war  /usr/local/tomcat/webapps/ROOT.war
ADD datasources.xml /data/appdatas/cat/datasources.xml
ADD datasources.sh /datasources.sh
ADD client.xml /data/appdatas/cat/client.xml
EXPOSE 8080
ENTRYPOINT [ "chmod +x /datasources.sh && /datasources.sh && catalina.sh run" ]
