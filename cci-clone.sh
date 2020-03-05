#!/usr/bin/env sh
# utility script to checkout code in CircleCI

GIT_REF=${CIRCLE_TAG}
if [ -z "${CIRCLE_TAG}" ]; then
    GIT_REF=${CIRCLE_BRANCH}
fi

git --version

export GIT_SSH_COMMAND="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"

set -o xtrace
git -c advice.detachedHead="false" clone --branch "${GIT_REF}" --depth 1 "${CIRCLE_REPOSITORY_URL}" .
