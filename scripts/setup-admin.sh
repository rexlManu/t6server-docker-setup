#!/bin/bash

WORKING_DIR=$(pwd)
SERVERS_DIR="$WORKING_DIR"/servers
LOGS_DIR="$SERVERS_DIR"/plutonium/storage/t6/logs/
INSTALL_DIR="$WORKING_DIR"/admin
# Customize if you want
PORT=1624

echo "Follow the installation, dont worry its normal that the tool fails to connect to the server"

chmod +x "$INSTALL_DIR"/StartIW4MAdmin.sh
CONTAINER_ID=$(docker run -itd --name t6server_iw4madmin \
	-v $LOGS_DIR:/t6server-logs \
	-v $INSTALL_DIR:/app \
	-p 1624:$PORT/tcp \
	t6server_iw4madmin)

docker attach $CONTAINER_ID
