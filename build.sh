#!/bin/bash

# ##*/でブランチ名が/で区切られていたとき、最後だけ持ってくる
# 強み：feature/hoge
# 弱み：alpha/hogeとbeta/hoge
CURRENT_BRANCH=`git rev-parse --abbrev-ref HEAD`
CURRENT_BRANCH=${CURRENT_BRANCH##*/}
echo ${CURRENT_BRANCH}

# (日本)時間の取得
# 20191231T213015 => 2019年12月31日の21h30m15s
TZ=JST BUILD_DATE=`date "+%Y%m%dT%H%M%S"`
echo ${BUILD_DATE}
