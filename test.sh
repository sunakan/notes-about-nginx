#!/bin/bash

echo "=====HOGE"
echo ${HOGE}
echo "====="

TEST_SECRET2=${HOGE}
echo "=====TEST_SECRET2"
echo ${TEST_SECRET2}
echo "====="

TEST_SECRET3=${HOGE:0:-1}
echo "=====TEST_SECRET3"
echo ${TEST_SECRET3}
echo "====="
