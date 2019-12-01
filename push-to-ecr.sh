#!/bin/bash

# 実行例
# IMAGE_TAG=${HOGE} bash push-to-ecr.sh ${AWS_ECR_REPO_NAME}
# or
# echo "${IMAGE_TAG}" | bash push-to-ecr.sh ${AWS_ECR_REPO_NAME}

# -u オプションは未定義変数を使うとError
set -u

# IMAGE_TAGが未定義なら、標準入力で読み込む
if [ -z "${IMAGE_TAG:+IMAGE_TAG}" ]; then
  read IMAGE_TAG
fi

# AWS_ECR_REGISTRYが未定義なら、ACCOUNT_IDを取得して作る(手動用)
if [ -z "${AWS_ECR_REGISTRY:+$AWS_ECR_REGISTRY}" ]; then
  AWS_ACCOUNT_ID=`aws sts get-caller-identity | jq -r '.Account'`
  AWS_DEFAULT_REGION=ap-northeast-1
  AWS_ECR_REGISTRY="${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com"
fi
AWS_ECR_REPO_NAME=$1

# ECRにpushする用のimage tagを付与
docker tag sunakan/suna-nginx:${IMAGE_TAG} ${AWS_ECR_REGISTRY}/${AWS_ECR_REPO_NAME}:${IMAGE_TAG}
docker push ${AWS_ECR_REGISTRY}/${AWS_ECR_REPO_NAME}:${IMAGE_TAG}
