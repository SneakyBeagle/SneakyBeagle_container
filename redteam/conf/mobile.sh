#!/bin/bash

WORKDIR="/root/"
GITHUB="https://github.com"

echo "Installing mobile tools"
cd $WORKDIR
git clone $GITHUB/MobSF/Mobile-Security-Framework-MobSF.git
echo "Done"