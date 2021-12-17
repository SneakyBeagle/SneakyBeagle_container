FROM debian:latest AS base
LABEL author="cbk914"
LABEL description="Container for Red Team Campaign"

RUN apt-get update && apt-get upgrade -y && apt-get install -y python3 python3-dev build-essential python3-pip redis-server terminator curl vim unzip libssl-dev \
    wget gnupg2 postgresql potgresql-contrib apt-transport-https lsb-release libreadline-dev libpq5 libpq-dev libreadline5 libsqlite3-dev libpcap-dev subversion \
    git-core autoconf zlib1g-dev libxml2-dev libxslt1-dev libyaml-dev ruby1.9.3 nmap && \
mkdir /root/RedTeamToolkit
COPY conf/*.sh /root/RedTeamToolkit/
RUN chmod +x /root/RedTeamToolkit/*.sh
