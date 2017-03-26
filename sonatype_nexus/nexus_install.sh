#!/bin/bash
set -e
echo "***********************************************************"
echo "* Sonatype Nexus Installer                                *"
echo "***********************************************************"
#sudo apt-get update
#sudo apt-get install openjdk-8-jre -y

mkdir -p $HOME/sonatype
wget http://download.sonatype.com/nexus/3/latest-unix.tar.gz -O /tmp/nexus-latest-unix.tar.gz
tar -C  $HOME/sonatype -xvf /tmp/nexus-latest-unix.tar.gz
rm -f /tmp/nexus-latest-unix.tar.gz

NEXUS_CONF="$HOME/sonatype/nexus-*/bin"
rm $NEXUS_CONF/nexus.vmoptions
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo $SCRIPT_DIR
cp $SCRIPT_DIR/nexus.vmoptions $NEXUS_CONF
. $SCRIPT_DIR/nexus_autoinit.sh
