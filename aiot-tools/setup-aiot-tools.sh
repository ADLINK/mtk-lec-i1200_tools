#!/bin/sh

tar zxvf aiot-tools.tar.gz --directory ${HOME}/

sudo cp 72-aiot.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules 
sudo udevadm trigger
