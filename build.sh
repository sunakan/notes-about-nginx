#!/bin/bash

# 実行例
# echo "${HOGE}" | bash ./build.sh
# or
# DOCKER_IMAGE="${HOGE}" bash ./build.sh

# -u オプションは未定義変数を使うとError
set -u

# ${hoge##*/}でブランチ名が/で区切られていたとき、最後だけ持ってくる
# 強み：feature/hoge
# 弱み：alpha/hogeとbeta/hoge
# TODO: GithubActionsでもここでブランチ名を取得できるなら、if文消せる
if [ -z "${CURRENT_BRANCH:+$CURRENT_BRANCH}" ]; then
  CURRENT_BRANCH=`git rev-parse --abbrev-ref HEAD`
fi
CURRENT_BRANCH=${CURRENT_BRANCH##*/}

# (UTC)時間の取得(ISO 8601)
# 2019年12月31日の21h30m15s => 20191231T213015Z
BUILD_DATE=`date -u "+%Y%m%dT%H%M%SZ"`

# コミットIDの最初の8文字
COMMIT_ID=`git show -s --format=%H`
COMMIT_ID=${COMMIT_ID:0:8}

# DockerImageのビルド
if [ -z "${DOCKER_IMAGE:+$DOCKER_IMAGE}" ]; then
  read DOCKER_IMAGE
fi
NGINX_VERSION_TAG=stable
IMAGE_TAG="${CURRENT_BRANCH}--${BUILD_DATE}--${COMMIT_ID}"

docker build \
  --tag ${DOCKER_IMAGE}:${IMAGE_TAG} \
  --build-arg NGINX_VERSION_TAG=${NGINX_VERSION_TAG} \
  .

docker tag ${DOCKER_IMAGE}:${IMAGE_TAG} ${DOCKER_IMAGE}:latest

# 以下のように書かない理由：GitHubActionと手動実行時とできるだけ同じにするため
# echo "##[set-output name=image_tag;]$(echo ${IMAGE_TAG})"
echo "built docker image"
echo ${DOCKER_IMAGE}:${IMAGE_TAG}
