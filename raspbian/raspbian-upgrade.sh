#!/bin/bash
set -e
echo "***********************************************************"
echo "* Full System Upgrade...                                  *"
echo "***********************************************************"
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
echo "Done!"
