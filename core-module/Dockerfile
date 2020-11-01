ARG BUILDER_IMAGE=docker.pkg.github.com/frankchethaka/monorepo-aws-fargate-github-action-demo/monorepo_build:latest
FROM ${BUILDER_IMAGE} as builder

WORKDIR /opt/app

FROM openjdk:11-jdk-slim
COPY --from=builder /opt/app/core-module/target/core-module-0.0.1-SNAPSHOT.jar .

ENTRYPOINT ["java"]
CMD ["-jar","core-module-0.0.1-SNAPSHOT.jar"]
