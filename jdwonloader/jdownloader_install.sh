#!/bin/bash
set -e
echo "***********************************************************"
echo "* JDownloader Installer                                   *"
echo "***********************************************************"
sudo apt-get install libjna-java -y
cd $HOME
mkdir JDownloader
cd JDownloader
wget http://installer.jdownloader.org/JDownloader.jar
java -jar JDownloader.jar
#sudo chmod +x $HOME/JDownloader/Core.jar
echo "Done!"
echo ""
echo "Please insert the following line to your crontab to start"
echo "JDownloader automatically at system startup."
echo ""
echo "@reboot java -jar /home/pi/JDownloader/JDownloader.jar &"
