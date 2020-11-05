ARG BUILDER_IMAGE=docker.pkg.github.com/frankchethaka/monorepo-aws-fargate-github-action-demo/monorepo_build:latest
FROM ${BUILDER_IMAGE} as builder

WORKDIR /opt/app

FROM openjdk:8-jdk-slim
COPY --from=builder /opt/app/web-module/target/web-module-0.0.1-SNAPSHOT.jar .

ENTRYPOINT ["java"]
CMD ["-jar","web-module-0.0.1-SNAPSHOT.jar"]
