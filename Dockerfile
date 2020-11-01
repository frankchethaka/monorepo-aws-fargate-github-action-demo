# Docker Multi-Stage Build uses for
ARG DEPS_IMAGE=docker.pkg.github.com/frankchethaka/monorepo-aws-fargate-github-action-demo/monorepo_deps:init
FROM DEPS_IMAGE maven:3.6.3-jdk-11 as deps

WORKDIR /opt/app

COPY maven_settings.xml /root/.m2/settings.xml

COPY core-module/pom.xml core-module/pom.xml
COPY web-module/pom.xml web-module/pom.xml

COPY pom.xml .

RUN mvn -B -e -C org.apache.maven.plugins:maven-dependency-plugin:3.1.2:go-offline

#
FROM maven:3.6.3-jdk-11 as builder
WORKDIR /opt/app

COPY --from=deps /root/.m2 /root/.m2
COPY --from=deps /opt/app/ /opt/app
COPY core-module/src core-module/src
COPY web-module/src web-module/src

RUN mvn -B -e clean install -DskipTests=true
