#!/bin/bash
set -e
# CUSTOMIZE THIS SCRIPT WITH YOUR OWN VALUES:
MYSQLUSER="root"
# End user edit parammeters

echo "***********************************************************"
echo "* Googs installation                                      *"
echo "*                                                 Step: 1 *"
echo "***********************************************************"
cd ~
if [ $(cat .bashrc | grep "# Go installation" | wc -l) -eq "0" ]; then
	echo "NOTE: Modifing .bashrc wit Go directories..."
	echo "# Go installation" >> .bashrc
	echo "if [ -d /opt/go/bin ]; then" >> .bashrc
	echo "    export GOROOT=/opt/go" >> .bashrc
	echo "    export GOPATH=\$HOME/srcs/go" >> .bashrc
	echo "    export PATH=\$PATH:\$GOROOT/bin" >> .bashrc
	echo "fi" >> .bashrc
	exec bash
	echo "Done!"
fi
echo "Installing Git and MySQL..."
sudo apt-get update
sudo apt-get install nano git  mysql-server -y
echo "Done!"
echo "Enabling SQLite3... (takes some time)"
# download and install dependencies (takes some time)
go get -u -tags sqlite github.com/gogits/gogs
# build
cd $GOPATH/src/github.com/gogits/gogs
go build -tags sqlite
echo "Done!"
echo "Configuring MySQL Database for Gogs..."
mysql -u $MYSQLUSER -p -e "DROP DATABASE IF EXISTS gogs;"
mysql -u $MYSQLUSER -p -e "CREATE DATABASE IF NOT EXISTS gogs CHARACTER SET utf8 COLLATE utf8_general_ci;"
mysql -u $MYSQLUSER -p -e "GRANT ALL ON gogs.* to 'gogs'@'localhost' identified by 'WRITE_CUSTOM_PASSWORD';"
echo "Done!"
mkdir -p ~/somewhere/gogs-repositories
cd $GOPATH/src/github.com/gogits/gogs
mkdir -p custom/conf
cp conf/app.ini custom/conf/app.ini
echo "**************************************************"
echo "* EDIT THE CONFIG FILE WITH YOUR OWN PARAMMETERS *"
echo "**************************************************"
read -rsp $'Press any key to continue...\n' -n1 key
nano custom/conf/app.ini
echo "Done! Please continue with the next step."
