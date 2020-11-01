# monorepo-aws-fargate-github-action-demo
Multi Module Springboot Pipeline with GitHub Actions to Deploy in AWS Fargate


1. Deps Image manual build for the 1st time

sudo docker -t docker.pkg.github.com/frankchethaka/monorepo-aws-fargate-github-action-demo/monorepo_deps:init \ 
  --build-arg DEPS_IMAGE=maven:3.6.3-jdk-11 .

sudo docker login https://docker.pkg.github.com -u <username> -p <github token>

sudo docker push docker.pkg.github.com/frankchethaka/monorepo-aws-fargate-github-action-demo/monorepo_deps
