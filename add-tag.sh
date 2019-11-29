#!/bin/bash

API_URL="https://api.github.com/repos/${REPO}/git/refs"

curl -s -X POST ${API_URL} \
  -H "Authorization: token ${GITHUB_TOKEN}" \
  -d @- << EOS
{
  "ref": "refs/tags/git-sha.${COMMIT:0:8}",
  "sha": "${COMMIT}"
}
EOS

curl -s -X POST ${API_URL} \
  -H "Authorization: token ${GITHUB_TOKEN}" \
  -d @- << EOS
{
  "ref": "refs/tags/git-branch.${GIT_BRANCH}",
  "sha": "${COMMIT}"
}
EOS
