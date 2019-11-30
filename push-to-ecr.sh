#!/bin/bash

echo "===========IMAGE_TAG"
echo ${IMAGE_TAG}
echo "==========="

# loginするためのコマンドをaws ecr get-loginで発行
# それを即実行するために$()で囲ってる
$(aws ecr get-login --no-include-email)
