#!/bin/bash

# ##*/でブランチ名が/で区切られていたとき、最後だけ持ってくる
# 強み：feature/hoge
# 弱み：alpha/hogeとbeta/hoge
CURRENT_BRANCH=`git rev-parse --abbrev-ref HEAD`
CURRENT_BRANCH=${CURRENT_BRANCH##*/}

echo ${CURRENT_BRANCH}
