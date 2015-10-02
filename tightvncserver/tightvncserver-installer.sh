#!/bin/bash
set -e
echo "***********************************************************"
echo "* Tightvncserver Installer                                *"
echo "***********************************************************"
echo "[INFO] Installing necessary packages..."
sudo apt-get install tightvncserver
#echo "OK"
#echo "[INFO] First launch..."
tightvncserver
#echo "OK"
echo "Done!"
exit 0
