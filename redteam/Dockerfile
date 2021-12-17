FROM debian:latest AS base
LABEL author="cbk914"
LABEL description="Container for Red Team Campaign"

RUN apt-get update && apt-get upgrade -y && apt-get install -y python3 python3-dev build-essential python3-pip redis-server terminator curl vim unzip libssl-dev wget gnupg2

COPY conf/*.sh /root/RedTeamToolkit/
RUN chmod +x /root/RedTeamToolkit/*.sh
