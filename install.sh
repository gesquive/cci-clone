#!/usr/bin/env bash
# install cci-clone
set -e

DL_URL="https://raw.githubusercontent.com/gesquive/cci-clone/master/cci-clone.sh"
OUTPATH="/usr/local/bin/cci-clone"

if [ "$1" == "local" ]; then # local install
    cp cci-clone.sh "${OUTPATH}"
else # internet install
    curl -sfL ${DL_URL} -o "${OUTPATH}"
fi

chmod +x "${OUTPATH}"
