#!/bin/bash

WORKDIR="/root/"
GITHUB="https://github.com"

echo "Installing evasion tools"
cd $WORKDIR
git clone $GITHUB/hfiref0x/UACME.git
echo "Done"