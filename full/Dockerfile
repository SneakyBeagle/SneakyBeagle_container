FROM kalilinux/kali-bleeding-edge:latest

# main setup and installation
RUN apt update
RUN apt upgrade -y
RUN apt install curl netcat nmap gobuster python3 python3-pip seclists iproute2 dnsutils iputils-ping testssl.sh emacs-nox sqlmap whois nikto wget ssh exploitdb man-db net-tools zsh git hydra w3m

# Some more custom tools
RUN mkdir /root/tools
RUN curl https://getcroc.schollz.com | bash
RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
RUN $ git clone https://github.com/commixproject/commix.git /root/tools/commix

# Cleanup
RUN apt autoremove -y
RUN apt autoclean -y

# aaannnd, done
ENTRYPOINT ["/bin/zsh"]
