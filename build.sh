#!/bin/bash

# ##*/でブランチ名が/で区切られていたとき、最後だけ持ってくる
# 強み：feature/hoge
# 弱み：alpha/hogeとbeta/hoge
CURRENT_BRANCH=`git rev-parse --abbrev-ref HEAD`
CURRENT_BRANCH=${CURRENT_BRANCH##*/}

# (日本)時間の取得
# 20191231T213015 => 2019年12月31日の21h30m15s
TZ=JST BUILD_DATE=`date "+%Y%m%dT%H%M%S"`

# コミットIDの最初の8文字
COMMIT_ID=`git show -s --format=%H`
COMMIT_ID=${COMMIT_ID:0:8}

NGINX_VERSION_TAG=stable
IMAGE_TAG="${CURRENT_BRANCH}-${BUILD_DATE}-${COMMIT_ID}"
docker build \
  --tag sunakan/suna-nginx:${IMAGE_TAG} \
  --build-arg NGINX_VERSION_TAG=${NGINX_VERSION_TAG} \
  .
