#!/bin/bash
set -e

echo "***********************************************************"
echo "* Googs installation                                      *"
echo "*                                                 Step: 2 *"
echo "***********************************************************"
cd ~
echo "INFO: This script takes some time (please wait)..."
cd $GOPATH/src/github.com/gogits/gogs
mkdir -p custom/https
cd custom/https
go run /opt/go-1.4/src/crypto/tls/generate_cert.go -ca=true -duration=8760h0m0s -host=server1
echo "Now it's time to launch Gogs at first time...."
cd $GOPATH/src/github.com/gogits/gogs 
echo "Done!"
echo "Please connect to your own Gogs server using:"
echo "      http://raspberry_ip:gogs_port"
echo "and follow the installation end steps."
./gogs web
