FROM kalilinux/kali-bleeding-edge:latest
ARG LICENSE

# update and upgrade
RUN apt-get update
#RUN apt-get upgrade -y

# install tools (hydra is used as a plugin in nessus)
RUN apt-get install -y curl wget hydra

# Nessus install
RUN wget "https://www.tenable.com/downloads/api/v1/public/pages/nessus/downloads/15327/download?i_agree_to_tenable_license_agreement=true" -O /root/Nessus.deb
RUN dpkg -i /root/Nessus.deb
RUN rm /root/Nessus.deb
## LICENSE SETUP
RUN license=$LICENSE
RUN echo "$license"

# Cleanup
RUN touch /root/.hushlogin
RUN apt-get autoremove -y
RUN apt-get autoclean -y

# Set working directory
WORKDIR /root/

EXPOSE 8834
CMD ["/opt/nessus/sbin/nessus-service"]
