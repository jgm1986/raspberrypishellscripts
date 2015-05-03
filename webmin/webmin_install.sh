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
wget http://prdownloads.sourceforge.net/webadmin/webmin_1.740_all.deb
sudo dpkg -i webmin_1.740_all.deb
rm webmin_1.740_all.deb
echo "Done!"
