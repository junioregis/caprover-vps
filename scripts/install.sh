#!/bin/bash

TIMEZONE=America/Sao_Paulo

# Timezone

sudo ln -snf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime
sudo sh -c "echo ${TIMEZONE} > /etc/timezone"

# Upgrade

sudo apt update
sudo apt upgrade -y
sudo apt install -y build-essential

# Swap Memory

SIZE="1024"

if [ -f /etc/dphys-swapfile ]; then
  sudo sed -i 's/^CONF_SWAPSIZE=[0-9]*$/CONF_SWAPSIZE=${SIZE}/' /etc/dphys-swapfile
fi

# Firewall

sudo ufw --force reset
sudo ufw allow ssh
sudo ufw allow 80,443,3000,996,7946,4789,2377/tcp
sudo ufw allow 7946,4789,2377/udp
sudo ufw default deny
sudo ufw --force enable

# SSH

sudo -u ${USER} bash -c "ssh-keygen -f ~/.ssh/id_rsa -b 2048 -t rsa -q -N ''"

# Docker

curl -sSL https://get.docker.com | sh

sudo usermod -aG docker ${USER}
sudo systemctl enable docker

# Clean System

sudo apt --purge autoremove
sudo apt clean

# Reboot System

sudo reboot
