#!/bin/bash

WORKDIR="/root/RedTeamToolkit/vulnscan"
GITHUB="https://github.com"

mkdir $WORKDIR

echo "Installing vulnerability scan tools"
apt update && apt install -y libsasl2-dev libldap2-dev
cd $WORKDIR
git clone $GITHUB/SecureAuthCorp/impacket.git
#git clone $GITHUB/CVE-2021-44228-Scanner.git
git clone $GITHUB/darkarnium/Log4j-CVE-Detect.git
git clone $GITHUB/chenjj/espoofer.git
git clone $GITHUB/GlobalCyberAlliance/DomainSecurityScanner.git
git clone $GITHUB/vavkamil/dkimsc4n.git
git clone $GITHUB/drwetter/testssl.sh.git
git clone $GITHUB/projectdiscovery/nuclei.git
cd $WORKDIR/projectdiscovery && \ 
    cd nuclei/v2/cmd/nuclei; \
    go build; \
    mv nuclei /usr/local/bin/; \
    nuclei -version;
    nuclei -ut;
cd $WORKDIR
echo "Done"