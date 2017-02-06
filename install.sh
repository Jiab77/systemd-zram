#!/bin/bash

# zRam install script for ubuntu/systemd
# Based on the work of mystilleef/FedoraZram
# URL: https://github.com/mystilleef/FedoraZram
# Created by Jiab77

# Starting install...
echo -e "\nBegin zRam install..."

# Disable existing swap space
echo -e "\t- Disable existing swap space..."
sudo swapoff -a

# Copying scripts to system binary folder
echo -e "\t- Copying scripts to system binary folder..."
sudo cp zramst* /usr/sbin/

# Setting scripts as executable
echo -e "\t- Setting scripts as executable..."
sudo chmod +x /usr/sbin/zramst*

# Copying service file to systemd folder
echo -e "\t- Copying service file to systemd folder..."
sudo cp mkzram.service /lib/systemd/system/

# Copying configuration file to systemd config folder
echo -e "\t- Copying configuration file to systemd config folder..."
sudo cp zram.conf /etc/systemd/

# Removes exec bit as requested by systemd
echo -e "\t- Removes exec bit as requested by systemd..."
sudo chmod -x /etc/systemd/zram.conf
sudo chmod -x /lib/systemd/system/mkzram.service

# Reloading services configuration
echo -e "\t- Reloading services configuration..."
sudo systemctl daemon-reload

# Enable then start the service
echo -e "\t- Enable then start the service...\n"
sudo systemctl enable mkzram.service
sudo systemctl start mkzram.service

# Install finished...
echo -e "\nzRam install done. Showing service status:\n"

# Showing status after service start
sudo systemctl status mkzram.service

# Showing compression stats and memory usage
echo -e "\nzRam memory drives:\n"
zramctl
echo -e "\nzRam compression stats:\n"
zramstat
echo -e "\nTotal memory size:\n"
free -mlht

# Small break
echo -e "\nPress enter to exit..."
read
exit 0
