#!/bin/bash
set -e
echo "***********************************************************"
echo "* JDownloader Installer for Raspberry Pi 2                *"
echo "***********************************************************"
echo "[ INFO ] Install Java 8 Runtime Environment."
sudo apt-get update
sudo apt-get install openjdk-8-jre -y
echo "[ INFO ] Creating installation directory."
cd $HOME
mkdir jdownloader
cd jdownloader
echo "[ INFO ] Download and install JDownloader."
wget http://installer.jdownloader.org/JDownloader.jar
java -Djava.awt.headless=true -jar JDownloader.jar
sudo reboot
