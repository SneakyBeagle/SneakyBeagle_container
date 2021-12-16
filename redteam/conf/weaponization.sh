#!/bin/bash

WORKDIR="/root/"
GITHUB="https://github.com"

echo "Installing weapon factory"
cd $WORKDIR
git clone $GITHUB/WyAtu/CVE-2018-20250.git
git clone $GITHUB/bhdresh/CVE-2017-8759.git
git clone $GITHUB/rxwx/CVE-2017-8570.git
echo "Done"