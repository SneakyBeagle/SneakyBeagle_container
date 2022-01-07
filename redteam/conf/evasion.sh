#!/bin/bash

WORKDIR="/root/RedTeamToolkit/evasion"
GITHUB="https://github.com"

mkdir $WORKDIR

echo "Installing evasion tools"
cd $WORKDIR
git clone $GITHUB/hfiref0x/UACME.git
cd $WORKDIR
git clone $GITHUB/0xsp-SRD/mortar.git
cd $WORKDIR
echo "Done"