# Docker Multi-Stage Build uses for
ARG DEPS_IMAGE=maven:3.6.3-jdk-11
FROM ${DEPS_IMAGE} as deps

WORKDIR /opt/app
RUN rm -rf core-module web-module

COPY maven_settings.xml /root/.m2/settings.xml

COPY core-module/pom.xml core-module/pom.xml
COPY web-module/pom.xml web-module/pom.xml

COPY pom.xml .

RUN mvn -B -e -C org.apache.maven.plugins:maven-dependency-plugin:3.1.2:go-offline

# Copy maven build
FROM maven:3.6.3-jdk-11 as builder
WORKDIR /opt/app

COPY --from=deps /root/.m2 /root/.m2
COPY --from=deps /opt/app/ /opt/app
COPY core-module/src core-module/src
COPY web-module/src web-module/src

RUN mvn -B -e clean install -DskipTests=true


