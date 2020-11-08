#!/bin/bash

# OpenSSH
# Copy files
sudo cp /home/$USER/.config/secureSSH/ssh_config /etc/ssh/ssh_config
sudo cp /home/$USER/.config/secureSSH/sshd_config /etc/ssh/sshd_config

#Create ssh-user group
sudo groupadd ssh-user
sudo usermod -aG ssh-user $USER

# If added diffie-hellman-group-exchange-sha256 to KexAlgorithms
# Generate Moduli
# ssh-keygen -M generate -O bits=4069 /tmp/moduli.all
# ssh-keygen -M screen -f /tmp/moduli.all moduli.safe
# sudo mv /tmp/moduli.safe /etc/ssh/moduli
# rm /tmp/moduli.all

# Generate fingerprint
sudo rm /etc/ssh/ssh_host_*key*
#sudo ssh-keygen -t rsa -b 4096 -f /etc/ssh/ssh_host_rsa_key -N "" < /dev/null
sudo ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N "" < /dev/null

# Enable openssh
sudo systemctl enable sshd.service
sudo systemctl restart sshd.service
