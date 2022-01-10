#!/bin/bash

WORKDIR="/root/RedTeamToolkit/vulnscan"
GITHUB="https://github.com"

mkdir $WORKDIR

echo "Installing vulnerability scan tools"
apt update && apt install -y libsasl2-dev libldap2-dev golang-go
cd $WORKDIR
git clone $GITHUB/SecureAuthCorp/impacket.git && cd impacket && python3 -m pip install . && cd $WORKDIR
git clone $GITHUB/darkarnium/Log4j-CVE-Detect.git
git clone $GITHUB/chenjj/espoofer.git && cd espoofer && pip3 install -r requirements.txt && cd $WORKDIR
git clone $GITHUB/GlobalCyberAlliance/DomainSecurityScanner.git && cd DomainSecurityScanner && make && cd $WORKDIR
git clone $GITHUB/vavkamil/dkimsc4n.git && cd dkimsc4n.git && pip3 install -r requirements.txt && cd $WORKDIR
git clone $GITHUB/drwetter/testssl.sh.git
#git clone $GITHUB/projectdiscovery/nuclei.git
#cd $WORKDIR/projectdiscovery && \ 
#    cd nuclei/v2/cmd/nuclei; \
#    go build; \
#    mv nuclei /usr/local/bin/; \
#    nuclei -version;
#    nuclei -ut;
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
nuclei -ut
cd $WORKDIR
echo "Done"