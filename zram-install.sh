#!/bin/bash

# zRam install script for ubuntu/systemd
# Based on the work of mystilleef/FedoraZram
# URL: https://github.com/mystilleef/FedoraZram
# Created by Jiab77

# Starting install...
echo -e "\nBegin zRam install...\n"

# Copying scripts to system binary folder
sudo cp -v zramst* /usr/sbin/

# Setting scripts to executable
sudo chmod -v +x /usr/sbin/zramst*

# Copying service file to systemd folder
sudo cp -v mkzram.service /lib/systemd/system/

# Copying configuration file to systemd config folder
sudo cp -v zram.conf /etc/systemd/

# Reloading system services
sudo systemctl daemon-reload

# Enabling then start the service
sudo systemctl enable mkzram.service
sudo systemctl start mkzram.service

# Install finished...
echo -e "\nzRam finished, showing some stats...\n"

# Showing status after service start
sudo systemctl status mkzram.service

# Showing compression stats
zramstat

# Small break
echo -e "Press any key to exit...\n"
read
exit 0
