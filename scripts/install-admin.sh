#!/bin/bash

WORKING_DIR=$(pwd)
INSTALL_DIR="$WORKING_DIR"/admin

rm -rf $INSTALL_DIR
mkdir -p $INSTALL_DIR

cd $INSTALL_DIR

curl -s https://api.github.com/repos/RaidMax/IW4M-Admin/releases \
	| grep -m 1 "browser_download_url" \
	| cut -d : -f 2,3 \
	| tr -d \" \
	| wget -qi -

unzip IW4MAdmin-*.zip
rm -f IW4MAdmin-*.zip

cp ../docker/Dockerfile.admin ./Dockerfile
docker build -t t6server_iw4madmin .
cd $WORKING_DIR
