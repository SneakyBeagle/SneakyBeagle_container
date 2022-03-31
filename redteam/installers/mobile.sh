#!/bin/bash

WORKDIR="/root/RedTeamToolkit/mobile"
GITHUB="https://github.com"

mkdir $WORKDIR

echo "Installing mobile tools"
cd $WORKDIR
git clone $GITHUB/MobSF/Mobile-Security-Framework-MobSF.git
git clone $GITHUB/dwisiswant0/apkleaks.git
cd $WORKDIR
echo "Done"
