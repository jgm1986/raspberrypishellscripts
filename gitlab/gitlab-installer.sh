#!/bin/bash
set -e
echo "***********************************************************"
echo "* Full System Upgrade...                                  *"
echo "***********************************************************"
echo "[INFO] Installing necessary packages..."
sudo apt-get install nodejs-legacy -y
echo "OK"
cd $HOME
echo "[INFO] Downloading Gitlab..."
wget https://downloads-packages.s3.amazonaws.com/raspberry-pi/gitlab-ce_7.12.0~omnibus%2B20150622131235-1_armhf.deb
echo "OK"
echo "[INFO] Installing..."
sudo dpkg -i gitlab-ce*.deb
echo "Edit the following file with your own parameters before continue:"
echo "   sudo nano /etc/gitlab/gitlab.rb"
echo ""
echo "Next, launch this command: "
echo "   sudo gitlab-ctl reconfigure"
echo ""
echo "Finally, sign in on your new micro-instance with username root"
echo " and password 5iveL!fe."
exit 0
