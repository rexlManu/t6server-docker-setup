#!/bin/bash

WORKING_DIR=$(pwd)
SERVERS_DIR="$WORKING_DIR"/servers
GAME_DIRECTORY="$SERVERS_DIR"/game
PLUTONIUM_DIRECTORY="$SERVERS_DIR"/plutonium

mkdir -p $SERVERS_DIR $GAME_DIRECTORY $PLUTONIUM_DIRECTORY

cp "$WORKING_DIR"/docker/Dockerfile.servers "$SERVERS_DIR"/Dockerfile
cp "$WORKING_DIR"/docker/server-launch.sh "$SERVERS_DIR"/launch.sh

cd $SERVERS_DIR

docker build -t t6server_server .

cd $WORKING_DIR
