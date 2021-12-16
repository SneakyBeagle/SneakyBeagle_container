#!/bin/bash

WORKDIR="/root/"
GITHUB="https://github.com"

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
echo "Done"