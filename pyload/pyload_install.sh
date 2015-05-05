#!/bin/bash
set -e
echo "***********************************************************"
echo "* pyLoad Installer                                        *"
echo "***********************************************************"
sudo apt-get -f install
sudo apt-get install	python-pycurl		\
			python-qt4		\
			python-crypto		\
			python-imaging		\
			tesseract-ocr		\
			tesseract-ocr-eng	\
			rhino			\
			python-openssl		\
			tesseract-ocr-spa	\
			-y
cd $HOME
wget -O pyload.deb http://get.pyload.org/get/ubuntu
sudo dpkg -i pyload.deb
rm pyload.deb
pyLoadCore -s
echo "Done!"
