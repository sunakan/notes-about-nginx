#!/bin/bash

# 外から必要な変数
#
# AWS_ECR_REPO_NAME=ベタ書きした時のリスクは。。。？
# IMAGE_TAG=push-docker-image-to-ecr-20191130T113404-317904d6

# Login
#
# loginするためのコマンドをaws ecr get-loginで発行
# それを即実行するために$()で囲ってる
# 手動実行するときは、コメントインする
# $(aws ecr get-login --no-include-email)

# actionsを利用するときは、AWS_ECR_REGISTRYをここで定義不要
#
# account idがaws cliで取ってこれるらしいのでそれを利用
# AWS_ACCOUNT_ID=$(aws sts get-caller-identity | jq -r '.Account')
# AWS_DEFAULT_REGION=ap-northeast-1
# AWS_ECR_REGISTRY=${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com

# ECRにpushする用のimage tagを付与
docker tag sunakan/suna-nginx:${IMAGE_TAG} "${AWS_ECR_REGISTRY}/${AWS_ECR_REPO_NAME}:${IMAGE_TAG}"

echo "=================="
docker image ls -a
echo "=================="
