#!/bin/bash

WORKING_DIR=$(pwd)
INSTALL_DIR="$WORKING_DIR"/admin
SERVERS_DIR="$WORKING_DIR"/servers
LOGS_DIR="$SERVERS_DIR"/plutonium/storage/t6/logs/
# Customize if you want
PORT=1624

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

echo "Follow the installation, dont worry its normal that the tool fails to connect to the server"

chmod +x "$INSTALL_DIR"/StartIW4MAdmin.sh
CONTAINER_ID=$(docker run -itd --name t6server_iw4madmin \
	-v $LOGS_DIR:/t6server-logs \
	-v $INSTALL_DIR:/app \
	-p 1624:$PORT/tcp \
	t6server_iw4madmin)

docker attach $CONTAINER_ID

cd $WORKING_DIR