# Dockerfile
FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    man-db neovim curl wget tree \
    jq ripgrep fd-find sed grep findutils \
    coreutils procps iputils-ping traceroute \
    net-tools btop htop xz-utils \
    bash-completion sudo cron at \
    zip unzip gzip bzip2 xz-utils \
    git make build-essential \
    python3 python3-pip nodejs npm \
    less more vim nano

RUN ln -s $(which fdfind) /usr/local/bin/fd

RUN yes | unminimize

# Create a training user
RUN useradd -ms /bin/bash student && echo "student ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER student
WORKDIR /home/student

# Copy start script and sample files
COPY --chown=student:student start.sh /home/student/start.sh
COPY --chown=student:student sample_data.txt /home/student/sample_data.txt
COPY --chown=student:student example_script.sh /home/student/example_script.sh
COPY --chown=student:student backup_script.sh /home/student/backup_script.sh
COPY --chown=student:student bashrc /home/student/.bashrc
RUN chmod +x /home/student/start.sh
RUN chmod +x /home/student/example_script.sh
RUN chmod +x /home/student/backup_script.sh

CMD ["/home/student/start.sh"]
