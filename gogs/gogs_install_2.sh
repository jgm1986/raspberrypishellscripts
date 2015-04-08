#!/bin/bash
set -e

echo "***********************************************************"
echo "* Googs installation                                      *"
echo "*                                                 Step: 2 *"
echo "***********************************************************"
cd ~
cd $GOPATH/src/github.com/gogits/gogs
mkdir -p custom/https
cd custom/https
go run /opt/go-1.4/src/crypto/tls/generate_cert.go -ca=true -duration=8760h0m0s -host=server1
