#!/bin/bash

WORKDIR="/root/RedTeamToolkit/activedirectory"
GITHUB="https://github.com"

mkdir $WORKDIR

echo "Installing AD tools"

apt-get update && apt-get install -y bloodhound golang-go pipenv
pip3 install ldap3 dnspython future ldapdomaindump kerberoast

git clone $GITHUB/SecuProject/ADenum.git && cd ADenum && pip3 install -r requirements.txt
cd $WORKDIR
git clone  $GITHUB/lkarlslund/adalanche.git && cd adalanche && ./build.sh
cd $WORKDIR
git clone $GITHUB/DanMcInerney/icebreaker.git && cd icebreaker && ./setup.sh && pipenv install --three && pipenv shell
cd $WORKDIR
echo "Done"