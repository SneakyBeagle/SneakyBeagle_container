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
git clone $GITHUB/joeammond/CVE-2021-4034.git CVE-2021-4034_python
git clone $GITHUB/c3c/CVE-2021-4034.git CVE-2021-4034_precompiled
git clone $GITHUB/berdav/CVE-2021-4034.git && cd CVE-2021-4034 && make
cd $WORKDIR
mkdir blasty-vs-pkexec2 && cd blasty-vs-pkexec2/ && curl https://haxx.in/files/blasty-vs-pkexec2.c -o blasty-vs-pkexec2.c && \
    gcc -o blasty-vs-pkexec2.so -fPIC -shared blasty-vs-pkexec2.c -Wl,-e,entry
mkdir CVE-2021-4034_custom_command && git clone https://github.com/zhzyker/CVE-2021-4034.git CVE-2021-4034_custom_command && cd CVE-2021-4034_custom_command && \
    gcc cve-2021-4034.c -o cve-2021-4034
cd $WORKDIR
echo "Done"
