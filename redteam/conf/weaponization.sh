#!/bin/bash

WORKDIR="/root/RedTeamToolkit/weapons"
GITHUB="https://github.com"

mkdir $WORKDIR

echo "Installing digital weapon factory"

apt update && apt install -y backdoor-factory

cd $WORKDIR

git clone $GITHUB/WyAtu/CVE-2018-20250.git
git clone $GITHUB/bhdresh/CVE-2017-8759.git
git clone $GITHUB/bhdresh/CVE-2017-0199.git
git clone $GITHUB/rxwx/CVE-2017-8570.git
git clone $GITHUB/koutto/jok3r.git && cd koutto/jok3r.git && chmod +x install-all.sh && ./install-all-sh && cd $WORKDIR
git clone $GITHUB/nccgroup/demiguise.git
git clone $GITHUB/Mr-Un1k0d3r/MaliciousMacroGenerator.git
git clone $GITHUB/Mr-Un1k0d3r/DKMC.git && cd Mr-Un1k0d3r/DKMC.git && mkdir output && cd $WORKDIR
git clone $GITHUB/0xdeadbeefJERKY/Office-DDE-Payloads.git && cd 0xdeadbeefJERKY/Office-DDE-Payloads && pip3 install -r requirements.txt && cd $WORKDIR
git clone $GITHUB/joker25000/DZGEN.git && cd joker25000/DZGEN.git && chmod +x DZGEN && cd $WORKDIR
git clone $GITHUB/Arno0x/EmbedInHTML.git
git clone $GITHUB/sevagas/macro_pack.git && cd sevagas/macro_pack.git && pip3 install -r requirements.txt && cd $WORKDIR
git clone $GITHUB/snovvcrash/DInjector.git
git clone $GITHUB/trustedsec/unicorn
#git clone $GITHUB/secretsquirrel/the-backdoor-factory.git
git clone $GITHUB/enigma0x3/Generate-Macro.git
git clone $GITHUB/infosecn1nja/MaliciousMacroMSBuild.git
git clone $GITHUB/FSecureLABS/wePWNise.git && pip3 install termcolor 
git clone $GITHUB/r00t-3xp10it/trojanizer.git && cd r00t-3xp10it/trojanizer.git && chmod +x *.sh && cd $WORKDIR
git clone $GITHUB/khr0x40sh/MacroShop.git
git clone $GITHUB/outflanknl/EvilClippy.git
git clone $GITHUB/TheWover/donut.git && cd TheWover/donut.git && make && cd $WORKDIR
git clone $GITHUB/DanMcInerney/icebreaker.git && cd DanMcInerney/icebreaker.git && chmod +x setup.sh && ./setup.sh && pipenv install --three && cd $WORKDIR
git clone $GITHUB/infobyte/evilgrade.git
git clone $GITHUB/mindcrypt/powerglot.git
cd $WORKDIR
echo "Done"