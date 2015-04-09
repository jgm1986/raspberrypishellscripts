#!/bin/bash
set -e

echo "***********************************************************"
echo "* Googs installation                                      *"
echo "*                                                 Step: 3 *"
echo "***********************************************************"
cd ~
mkdir $GOPATH/src/github.com/gogits/gogs/log/
cp start.sh $GOPATH/src/github.com/gogits/gogs/start.sh
sudo chmod +x $GOPATH/src/github.com/gogits/gogs/start.sh
cp start.sh $GOPATH/src/github.com/gogits/gogs/start.sh
sudo cp gogs-service /etc/init.d/gogs-service
sudo chmod +x /etc/init.d/gogs-service
sudo service gogs-service start
echo "Done!"
echo "Please connect to your own Gogs server using:"
echo "      http://raspberry_ip:gogs_port"
echo "and check if Gogs is running."
echo ""
read -rsp $'If the Gogs server is running, press Y key to launch Gogs at system startup automatically...\n' -n1 key
if [[ "$key" == "Y" ]] || [[ "$key" == "y" ]]; then
        echo "Preparing Gogs for automatic start."
		sudo update-rc.d gogs-service defaults
		echo "Done!"
		echo "INFO: Your Gogs installation has finished correctly. Please reboot your Raspberry Pi and check if Gogs is running automatically at startup."
else
        echo "INFO: Something goes wrong and your Gogs server will not be lauched automatically on system startup."
fi
