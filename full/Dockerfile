FROM kalilinux/kali-bleeding-edge:latest

RUN apt update
RUN apt upgrade -y
RUN apt install curl netcat nmap gobuster python3 python3-pip seclists iproute2 dnsutils iputils-ping testssl.sh emacs-nox sqlmap whois nikto wget ssh exploitdb man-db net-tools zsh git hydra w3m
RUN curl https://getcroc.schollz.com | bash
RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
RUN mkdir /root/tools
RUN apt autoremove -y
RUN apt autoclean -y
ENTRYPOINT ["/bin/zsh"]