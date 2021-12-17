#!/bin/bash

WORKDIR="/root/RedTeamToolkit/privesc"
GITHUB="https://github.com"

mkdir $WORKDIR

echo "Installing privilege escalation tools"
cd $WORKDIR
git clone $GITHUB/AlessandroZ/BeRoot.git
git clone $GITHUB/rebootuser/LinEnum.git
git clone $GITHUB/InteliSecureLabs/Linux_exploit_Suggester.git
git clone $GITHUB/sleventyeleven/linuxprivchecker.git
git clone $GITHUB/diego-treitos/linux-smart-enumeration.git
git clone $GITHUB/411Hall/JAWS.git
git clone $GITHUB/bitsadmin/wesng.git
git clone $GITHUB/absolomb/WindowsEnum.git
git clone $GITHUB/cckuailong/Log4j_CVE-2021-45046.git
git clone $GITHUB/lgandx/Responder.git
git clone $GITHUB/SecWiki/windows-kernel-exploits.git
echo "Done"