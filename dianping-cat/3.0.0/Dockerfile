FROM centos:centos6
LABEL maintainer="htynkn@gmail.com"

USER root

ENV JAVA_VERSION 1.7.0
RUN	yum install -y wget tar git java-1.7.0-openjdk java-1.7.0-openjdk-devel

ENV JAVA_HOME /usr/lib/jvm/java


ENV CATALINA_HOME /usr/local/tomcat
RUN mkdir -p "$CATALINA_HOME"
ENV PATH $CATALINA_HOME/bin:$PATH
WORKDIR $CATALINA_HOME


ENV TOMCAT_MAJOR_VERSION 7
ENV TOMCAT_MINOR_VERSION 7.0.79

RUN wget -q https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz && \
    wget -qO- https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz.md5 | md5sum -c - && \
    tar zxf apache-tomcat-*.tar.gz && \
    mv apache-tomcat-${TOMCAT_MINOR_VERSION}/* . && \
    rm -rf apache-tomcat-*

ENV MAVEN_VERSION_MAJOR 3
ENV MAVEN_VERSION_MINOR 5.2

RUN wget http://archive.apache.org/dist/maven/maven-${MAVEN_VERSION_MAJOR}/${MAVEN_VERSION_MAJOR}.${MAVEN_VERSION_MINOR}/binaries/apache-maven-${MAVEN_VERSION_MAJOR}.${MAVEN_VERSION_MINOR}-bin.tar.gz && \
    tar xvf apache-maven-${MAVEN_VERSION_MAJOR}.${MAVEN_VERSION_MINOR}-bin.tar.gz && \
    rm apache-maven-${MAVEN_VERSION_MAJOR}.${MAVEN_VERSION_MINOR}-bin.tar.gz && \
    mv apache-maven-${MAVEN_VERSION_MAJOR}.${MAVEN_VERSION_MINOR}  /usr/local/apache-maven
ENV M2_HOME=/usr/local/apache-maven
ENV M2=$M2_HOME/bin
ENV PATH=$M2:$PATH

RUN mkdir -p /root/workspace
WORKDIR /root/workspace

RUN git clone --depth=1 --single-branch --branch v3.0.0 https://github.com/dianping/cat
WORKDIR /root/workspace/cat

RUN set -ex && mvn clean install -DskipTests
RUN cp cat-home/target/*.war $CATALINA_HOME/webapps/cat.war

ADD datasources.xml /data/appdatas/cat/datasources.xml
ADD datasources.sh /datasources.sh
ADD client.xml /data/appdatas/cat/client.xml
RUN sed -i "s/port=\"8080\"/port=\"8080\"\ URIEncoding=\"utf-8\"/g" /usr/local/tomcat/conf/server.xml

EXPOSE 8080
