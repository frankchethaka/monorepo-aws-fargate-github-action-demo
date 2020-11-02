# monorepo-aws-fargate-github-action-demo
Multi Module Springboot Pipeline with GitHub Actions to Deploy in AWS Fargate

GitHub Action Workflow : 


- Workflow 1: Build monorepo dependencies and push to GitHub Repo
    - Workflow trigger: Cron task (Weekly perhaps)
    - Steps:
        - Checkout the Code
        - Update maven settings file with GitHub token
        - Build Docker image which will download the dependencies
        - Push images to GitHub
- Workflow 2: Build individual Docker images and deploy to AWS Fargate
    - Workflow trigger: Push on branch 
        - job 1: Build Images
            - Steps: 
               - Checkout the Code
               - Update maven settings file with GitHub token
               - Build Docker file for each module
                    - Dockerfile uses multistage build started with image from  Workflow 1. 
                    - This is to reduce the build time. 
               - Push each image to GitHub Docker Repo. 
        - job 2: Deploy to AWS Fargate
    