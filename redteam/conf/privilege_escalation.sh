#!/bin/bash

WORKDIR="/root/RedTeamToolkit/privesc"
GITHUB="https://github.com"

mkdir $WORKDIR

echo "Installing privilege escalation tools"
cd $WORKDIR
git clone $GITHUB/AlessandroZ/BeRoot.git
git clone $GITHUB/rebootuser/LinEnum.git
git clone $GITHUB/InteliSecureLabs/Linux_exploit_Suggester.git
#git clone $GITHUB/sleventyeleven/linuxprivchecker.git
pip3 install linuxprivchecker
git clone $GITHUB/diego-treitos/linux-smart-enumeration.git && cd linux-smart-enumeration && chmod 700 lse.sh && cd $WORKDIR
git clone $GITHUB/411Hall/JAWS.git
git clone $GITHUB/bitsadmin/wesng.git && cd wesng && python3 wes.py --update && cd $WORKDIR
git clone $GITHUB/absolomb/WindowsEnum.git
git clone $GITHUB/cckuailong/Log4j_CVE-2021-45046.git
git clone $GITHUB/lgandx/Responder.git
git clone $GITHUB/SecWiki/windows-kernel-exploits.git
cd $WORKDIR
echo "Done"