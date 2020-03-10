#!/usr/bin/env sh
# utility script to clone code quickly in CircleCI

GIT_REF=${CIRCLE_TAG}
if [ -z "${CIRCLE_TAG}" ]; then
    GIT_REF=${CIRCLE_BRANCH}
fi

git --version

export GIT_SSH_COMMAND="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"

# hide the paragraph about being in a detached head state, no one cares
git config advice.detachedHead false

set -o xtrace
git clone --branch "${GIT_REF}" --depth 1 "${CIRCLE_REPOSITORY_URL}" .
