#!/usr/bin/env sh
# utility script to clone code quickly in CircleCI

GIT_REF=${CIRCLE_TAG}
if [ -z "${CIRCLE_TAG}" ]; then
    GIT_REF=${CIRCLE_BRANCH}
fi

git --version

# Add github as an ssh known host
mkdir -p "${HOME}/.ssh"
if ! grep github.com "${HOME}/.ssh/config" > /dev/null; then
     echo "Host github.com" >> "${HOME}/.ssh/config"
     echo "  StrictHostKeyChecking accept-new" >> "${HOME}/.ssh/config"
fi
# hide the paragraph about being in a detached head state, no one cares
git config advice.detachedHead false

set -o xtrace
git clone --branch "${GIT_REF}" --depth 1 "${CIRCLE_REPOSITORY_URL}" .
