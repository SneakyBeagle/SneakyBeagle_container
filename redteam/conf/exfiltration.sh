#!/bin/bash

WORKDIR="/root/RedTeamToolkit/exfiltration"
GITHUB="https://github.com"

mkdir $WORKDIR

echo "Installing exfiltration tools"
cd $WORKDIR
git clone $GITHUB/IncideDigital/Mistica.git && cd Mistica && pip3 install dnslib
cd $WORKDIR
git clone $GITHUB/iagox86/dnscat2.git
git clone $GITHUB/Arno0x/DNSExfiltrator.git && cd DNSExfiltrator && pip3 install -r requirements.txt
cd $WORKDIR
git clone $GITHUB/FortyNorthSecurity/Egress-Assess.git && pip3 install pyftpdlib && cd Egress-Assess && openssl req -new -x509 -keyout server.pem -out server.pem -days 365 -nodes
cd $WORKDIR
git clone $GITHUB/PaulSec/DET.git && cd DET && pip3 install -r requirements.txt
cd $WORKDIR
git clone $GITHUB/Viralmaniar/Powershell-RAT.git
cd $WORKDIR
git clone $GITHUB/SECFORCE/Tunna.git
cd $WORKDIR
# git clone $GITHUB/py2exe/py2exe.git && cd py2exe && python3 setup.py install
#cd $WORKDIR
git clone $GITHUB/ytisf/PyExfil.git && cd PyExfil && pip3 install -r requirements3.txt
cd $WORKDIR
echo "Done"