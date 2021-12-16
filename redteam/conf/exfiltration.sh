#!/bin/bash

WORKDIR="/root/"
GITHUB="https://github.com"

echo "Installing exfiltration tools"
cd $WORKDIR
git clone $GITHUB/IncideDigital/Mistica.git
echo "Done"