FROM debian:latest AS base
LABEL author="cbk914"
LABEL description="Container for Red Team Campaign"
ENV WORKDIR_ENV=/redteam
WORKDIR ${WORKDIR_ENV}
SHELL ["/bin/bash", " -c"]
RUN apt-get update && apt-get upgrade -y && apt-get install -y 

