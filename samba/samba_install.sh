#!/bin/bash
set -e
echo "***********************************************************"
echo "* Samba Installer                                         *"
echo "***********************************************************"

sudo apt-get install	samba			\
			samba-common-bin	\
			-y

echo "Setting parammeters for shared folder /home/pi/Descargas"
# ------ EDIT THIS BLOCK  WITH YOUR OWN PREFERENCES------------
sudo sed -i "\$a[Raspberry Pi Downloads]" /etc/samba/smb.conf
sudo sed -i "\$acomment = Raspberry Pi Downloads" /etc/samba/smb.conf
sudo sed -i "\$apath = /home/pi/usb/downloads" /etc/samba/smb.conf
sudo sed -i "\$awriteable = Yes" /etc/samba/smb.conf
sudo sed -i "\$acreate mask = 0777" /etc/samba/smb.conf
sudo sed -i "\$adirectory mask = 0777" /etc/samba/smb.conf
sudo sed -i "\$abrowseable = Yes" /etc/samba/smb.conf
sudo sed -i "\$avalid users @users" /etc/samba/smb.conf
sudo sed -i "\$aforce user = pi" /etc/samba/smb.conf
sudo sed -i "\$ahide files = /lost+found/" /etc/samba/smb.conf
# --------------------------------------------------------------
echo "[ OK ]"

sudo smbpasswd -a pi
sudo /etc/init.d/samba restart
echo "Done!"
