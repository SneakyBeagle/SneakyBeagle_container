#!/bin/bash

WORKDIR="/root/"
GITHUB="https://github.com"

echo "Installing vulnerability scan tools"
cd $WORKDIR
#git clone $GITHUB/CVE-2021-44228-Scanner.git
git clone $GITHUB/darkarnium/Log4j-CVE-Detect.git