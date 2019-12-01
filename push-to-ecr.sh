#!/bin/bash

set -u

# IMAGE_TAGが未定義なら、標準入力で読み込む
if [ -z ${IMAGE_TAG:+IMAGE_TAG} ]; then
  read IMAGE_TAG
fi

# Login
#
# loginするためのコマンドをaws ecr get-loginで発行
# それを即実行するために$()で囲ってる
$(aws ecr get-login --no-include-email)

# account idがaws cliで取ってこれるらしいのでそれを利用
# 第1引数をAWS_ECR_REPO_NAMEにしている
AWS_ACCOUNT_ID=$(aws sts get-caller-identity | jq -r '.Account')
AWS_DEFAULT_REGION=ap-northeast-1
AWS_ECR_REGISTRY=${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com
AWS_ECR_REPO_NAME=$1

# GitHub Actionのログに出力されたとき、マスクしてほしい
# (手動実行時はこれで見えてしまう)
echo "::add-mask::${AWS_ACCOUNT_ID}"
echo "::add-mask::${AWS_ECR_REPO_NAME}"

# ECRにpushする用のimage tagを付与
docker tag sunakan/suna-nginx:${IMAGE_TAG} ${AWS_ECR_REGISTRY}/${AWS_ECR_REPO_NAME}:${IMAGE_TAG}
docker push ${AWS_ECR_REGISTRY}/${AWS_ECR_REPO_NAME}:${IMAGE_TAG}
