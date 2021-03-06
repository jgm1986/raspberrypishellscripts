#!/bin/bash
set -e
echo "***********************************************************"
echo "* Cleaning System...                                      *"
echo "***********************************************************"

sudo apt-get remove --purge minecraft-pi python-minecraftpi wolfram-engine sonic-pi scratch nuscratch libreoffice* geany nodered -y

sudo apt-get purge -y
sudo apt-get autoclean -y
sudo apt-get autoremove -y
echo "Done!"
