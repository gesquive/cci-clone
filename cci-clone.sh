#!/usr/bin/env sh
# utility script to clone code quickly in CircleCI

GIT_REF=${CIRCLE_TAG}
if [ -z "${CIRCLE_TAG}" ]; then
    GIT_REF=${CIRCLE_BRANCH}
fi

git --version

# Add github as an ssh known host
mkdir -p ${HOME}/.ssh
if ! grep github.com ${HOME}/.ssh/known_hosts > /dev/null; then
     echo "github.com ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==" >> ${HOME}/.ssh/known_hosts
fi
# hide the paragraph about being in a detached head state, no one cares
git config advice.detachedHead false

set -o xtrace
git clone --branch "${GIT_REF}" --depth 1 "${CIRCLE_REPOSITORY_URL}" .
