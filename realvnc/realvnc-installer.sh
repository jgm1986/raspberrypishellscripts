#!/bin/bash
set -e

cd $HOME
wget -O realvnc.tar.gz http://www.realvnc.com/download/binary/1769/
tar xfv realvnc.tar.gz
sudo dpkg -i VNC-Server-*-Linux-ARM.deb
sudo vnclicense -add PUT_HERE_YOUR_LICENSE

