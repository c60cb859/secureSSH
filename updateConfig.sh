#!/bin/bash

# OpenSSH
# Copy files
sudo cp /home/$USER/.config/secureSSH/ssh_config /etc/ssh/ssh_config
sudo cp /home/$USER/.config/secureSSH/sshd_config /etc/ssh/sshd_config

sudo systemctl restart sshd.service
