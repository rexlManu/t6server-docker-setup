#!/bin/bash

WORKING_DIR=$(pwd)
SERVERS_DIR="$WORKING_DIR"/servers
GAME_DIRECTORY="$SERVERS_DIR"/game
PLUTONIUM_DIRECTORY="$SERVERS_DIR"/plutonium

read -e -p "Please enter the name of the server without spaces? " -i "server1" SERVER_NAME
read -e -p "Please enter the key from plutonium? " SERVER_KEY
read -e -p "Please enter the port for the server? " -i "4976" SERVER_PORT
read -e -p "Please enter the mode of the server (Multiplayer/Zombie)? " -i "Multiplayer" SERVER_MODE
read -e -p "Please specifiy the path of your configuration (absolute path)? " SERVER_CONFIG_PATH

docker run -d \
	--name t6server_$SERVER_NAME \
	-p 4976:$SERVER_PORT/udp \
        -e KEY=$SERVER_KEY \
        -v $GAME_DIRECTORY:/server/game \
        -v $SERVER_CONFIG_PATH:/server/game/$SERVER_MODE/main/dedicated.cfg \
        -v $PLUTONIUM_DIRECTORY:/server/plutonium t6server_server

