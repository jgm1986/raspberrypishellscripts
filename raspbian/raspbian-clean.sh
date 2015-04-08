#!/bin/bash
set -e
echo "***********************************************************"
echo "* Cleaning System...                                      *"
echo "***********************************************************"
sudo apt-get purge -y
sudo apt-get autoclean -y
sudo apt-get autoremove -y
echo "Done!"
