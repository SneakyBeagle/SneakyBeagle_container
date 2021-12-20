#!/bin/bash

WORKDIR="/root/RedTeamToolkit/weapons"
GITHUB="https://github.com"

mkdir $WORKDIR

echo "Installing weapon factory"
cd $WORKDIR

git clone $GITHUB/WyAtu/CVE-2018-20250.git
git clone $GITHUB/bhdresh/CVE-2017-8759.git
git clone $GITHUB/bhdresh/CVE-2017-0199.git
git clone $GITHUB/rxwx/CVE-2017-8570.git
git clone $GITHUB/koutto/jok3r.git
git clone $GITHUB/nccgroup/demiguise.git
git clone $GITHUB/Mr-Un1k0d3r/MaliciousMacroGenerator.git
git clone $GITHUB/Mr-Un1k0d3r/DKMC.git
git clone $GITHUB/0xdeadbeefJERKY/Office-DDE-Payloads.git
git clone $GITHUB/joker25000/DZGEN.git
git clone $GITHUB/Arno0x/EmbedInHTML.git
git clone $GITHUB/sevagas/macro_pack.git
git clone $GITHUB/snovvcrash/DInjector.git
git clone $GITHUB/trustedsec/unicorn
git clone $GITHUB/secretsquirrel/the-backdoor-factory.git
git clone $GITHUB/enigma0x3/Generate-Macro.git
git clone $GITHUB/infosecn1nja/MaliciousMacroMSBuild.git
git clone $GITHUB/FSecureLABS/wePWNise.git
git clone $GITHUB/r00t-3xp10it/trojanizer.git
git clone $GITHUB/khr0x40sh/MacroShop.git
git clone $GITHUB/outflanknl/EvilClippy.git
git clone $GITHUB/TheWover/donut.git
git clone $GITHUB/DanMcInerney/icebreaker.git
git clone $GITHUB/infobyte/evilgrade.git
git clone $GITHUB/mindcrypt/powerglot.git
echo "Done"