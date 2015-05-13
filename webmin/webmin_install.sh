#!/bin/bash
set -e

echo "***********************************************************"
echo "* Webmin installation                                     *"
echo "***********************************************************"
cd ~
echo "Starting Webmin installation..."
sudo apt-get install	perl				\
			libnet-ssleay-perl		\
			openssl				\
			libauthen-pam-perl		\
			libpam-runtime 			\
			libio-pty-perl			\
			apt-show-versions		\
			python				\
			libauthen-sasl-cyrus-perl	\
			libauthen-sasl-perl		\
			mdadm				\
			-y
wget -O webmin.deb http://sourceforge.net/projects/webadmin/files/latest/download
sudo dpkg -i webmin.deb
rm webmin.deb
echo "Done!"
