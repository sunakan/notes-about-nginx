#!/bin/bash

MY_SECRET_FACTOR="I'm a hero."

echo "=============何もしないでいきなり出力"
echo ${MY_SECRET_FACTOR}

echo "=============add-maskして出力"
echo "::add-mask::${MY_SECRET_FACTOR}"
echo ${MY_SECRET_FACTOR}

echo "=============set-output"
echo "::set-output name=my_secret_factor::${MY_SECRET_FACTOR}"

echo "=============set-env"
echo "::set-env name=MY_SECRET_FACTOR_ENV::${MY_SECRET_FACTOR}"
