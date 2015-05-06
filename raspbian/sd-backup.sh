#!/bin/bash
set -e
echo "***********************************************************"
echo "* Raspbian SD Backup.                                     *"
echo "*                                                         *"
echo "* WARNING: Please wait until this script end.             *"
echo "***********************************************************"
echo ""
echo "INFO: The destination of this backup will be:"
echo "                /home/pi/Descargas"
echo ""
echo "INFO: Creating SD backup..."
sudo dd if=/dev/mmcblk0 of=/home/pi/Descargas/raspberry_pyLoad.img bs=1M
echo "[ OK ]"
echo "INFO: Compressing backup image file..."
gzip --best Descargas/raspberry_pyLoad.img
echo "[ OK ]"
sudo rm -r Descargas/raspberry_pyLoad.img
echo "Done! Your Raspberry Pi SD backup has finished!"
