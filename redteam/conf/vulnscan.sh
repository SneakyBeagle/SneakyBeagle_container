#!/bin/bash

WORKDIR="/root/"
GITHUB="https://github.com"

echo "Installing vulnerability scan tools"
apt update && apt install -y libsasl2-dev libldap2-dev
cd $WORKDIR
git clone $GITHUB/SecureAuthCorp/impacket.git
#git clone $GITHUB/CVE-2021-44228-Scanner.git
git clone $GITHUB/darkarnium/Log4j-CVE-Detect.git
git clone $GITHUB/projectdiscovery/nuclei.git
cd $GITHUB/projectdiscovery && \ 
    cd nuclei/v2/cmd/nuclei; \
    go build; \
    mv nuclei /usr/local/bin/; \
    nuclei -version;
    nuclei -ut;
cd $WORKDIR
git clone https://github.com/1N3/Sn1per
cd Sn1per
bash install.sh
echo "Done"