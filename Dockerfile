FROM maven:3.6.3-jdk-11 as deps

WORKDIR /opt/app

COPY maven_settings.xml /root/.m2/settings.xml

COPY core-module/pom.xml core-module/pom.xml
COPY web-module/pom.xml web-module/pom.xml

COPY pom.xml .

RUN mvn -B -e -C org.apache.maven.plugins:maven-dependency-plugin:3.1.2:go-offline
