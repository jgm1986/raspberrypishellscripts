#!/bin/bash
set -e
echo "***********************************************************"
echo "* GitLab Installer for Raspberry Pi 2                     *"
echo "***********************************************************"
echo "1. Install and configure the necessary dependencies..."
sudo apt-get install curl openssh-server ca-certificates postfix apt-transport-https
curl https://packages.gitlab.com/gpg.key | sudo apt-key add -
echo "2. Add the GitLab package server and install the package"
sudo curl -sS https://packages.gitlab.com/install/repositories/gitlab/raspberry-pi2/script.deb.sh | sudo bash
sudo apt-get install gitlab-ce
echo "Edit the following file with your own parameters before continue:"
echo "   sudo nano /etc/gitlab/gitlab.rb"
echo ""
echo "Next, launch this command: "
echo "   sudo gitlab-ctl reconfigure"
echo ""
echo "Finally, sign in on your new micro-instance with username root"
echo " and password 5iveL!fe."
exit 0
