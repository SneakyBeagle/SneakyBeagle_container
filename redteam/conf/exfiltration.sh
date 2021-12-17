#!/bin/bash

WORKDIR="/root/RedTeamToolkit/exfiltration"
GITHUB="https://github.com"

mkdir $WORKDIR

echo "Installing exfiltration tools"
cd $WORKDIR
git clone $GITHUB/IncideDigital/Mistica.git
git clone $GITHUB/iagox86/dnscat2.git
git clone $GITHUB/Arno0x/DNSExfiltrator.git
git clone $GITHUB/FortyNorthSecurity/Egress-Assess.git
git clone $GITHUB/PaulSec/DET.git
git clone $GITHUB/Viralmaniar/Powershell-RAT.git
git clone $GITHUB/ytisf/PyExfil.git
git clone $GITHUB/SECFORCE/Tunna.git
echo "Done"