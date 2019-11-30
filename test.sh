#!/bin/bash

echo "=====HOGE"
echo ${HOGE}
echo "====="

TEST_SECRET2=${HOGE}
echo "=====TEST_SECRET2"
echo ${TEST_SECRET2}
echo "====="

TEST_SECRET3=${HOGE}HOGEHOGEHOGEHOGEHOGEHOGE
echo "=====TEST_SECRET3"
echo ${TEST_SECRET3}
echo "====="

TEST_SECRET4=${HOGE:0:1}
echo "=====TEST_SECRET4最初の1文字を出力"
echo ${TEST_SECRET4}
echo "====="

TEST_SECRET5=${HOGE:1}
echo "=====TEST_SECRET5最初の1文字を抜いて出力"
echo ${TEST_SECRET5}
echo "====="

TEST_JOIN=${TEST_SECRET4}${TEST_SECRET5}
echo "=====つなげてみた"
echo ${TEST_JOIN}
echo "====="
