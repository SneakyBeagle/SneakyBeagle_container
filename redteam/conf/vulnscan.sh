#!/bin/bash

WORKDIR="/root/"
GITHUB="https://github.com"

echo "Installing vulnerability scan tools"
apt update && apt install -y libsasl2-dev libldap2-dev
cd $WORKDIR
git clone $GITHUB/SecureAuthCorp/impacket.git
#git clone $GITHUB/CVE-2021-44228-Scanner.git
git clone $GITHUB/darkarnium/Log4j-CVE-Detect.git

echo "Done"