#!/bin/bash
set -e
echo "***********************************************************"
echo "* JDownloader Installer for Raspberry Pi 2                *"
echo "***********************************************************"
echo "[ INFO ] Creating installation directory."
cd $HOME
cd jdownloader
echo "[ INFO ] Download and install JDownloader."
java -Djava.awt.headless=true -jar JDownloader.jar
echo "[ INFO ] Auto init at startup"
line="@reboot java -Djava.awt.headless=true -jar /home/pi/jdownloader/JDownloader.jar"
(crontab -u pi -l; echo "$line" ) | crontab -u pi -
exit 0
