#!/bin/bash
set -e

# PERSONALIZE THIS SCRIPT WITH THIS PARAMMETERS
USB_DRIVE1=/dev/sda1		# USB Drive for downloads.
MDIR_DRIVE1=/home/pi/books	# Mount directory for USB_DRIVE1.

echo "***********************************************************"
echo "* Format and mounting Calibre USB for books...             *"
echo "***********************************************************"
echo "WARNING! All data saved on the USB drives will be ereased."
read -rsp $'Press Y if you want continue with this process...' -n1 key
if [[ "$key" == "Y" ]] || [[ "$key" == "y" ]]; then
	# UNCOMMENT THESE LINES IF YOU HAVE TO UNMOUNT YOUR DEVICES
	#echo "Unmounting USB drive..."
	#sudo umount $USB_DRIVE1
	#echo "[ OK ]"
	echo "Formating as ext4 filesystem..."
	sudo mkfs.ext4 $USB_DRIVE1
	echo "[ OK ]"
	echo "Generate mount directories..."
	mkdir -p $MDIR_DRIVE1
	echo "[ OK ]"
	echo "Modifyng FSTAB file..."
	echo $USB_DRIVE1 $MDIR_DRIVE1 ext4 defaults 0 0 | sudo tee -a /etc/fstab
	echo "[ OK ]"
	echo "Reloading FSTAB..."
	sudo mount -a
	echo "[ OK ]"
else
	echo "Nothing to do..."
fi
echo "Done!"
df -h
exit 0
