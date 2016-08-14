!#/bin/bash

# zram install script for ubuntu/systemd
# Based on the work of mystilleef/FedoraZram
# URL: https://github.com/mystilleef/FedoraZram
# Created by Jiab77

# Copying scripts to system binary folder
sudo cp -v zramst* /usr/sbin/

# Copying service file to systemd folder
sudo cp -v mkzram.service /lib/systemd/system/

# Copying configuration file to systemd config folder
sudo cp -v zram.conf /etc/systemd/

# Reloading system services
sudo systemctl daemon-reload

# Enabling then start the service
sudo systemctl enable mkzram.service
sudo systemctl start mkzram.service

# Showing status after service start
sudo systemctl status mkzram.service

# Showing compression stats
zramstat
