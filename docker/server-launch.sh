#!/bin/bash
MODE_PATH=""
if [ "$MODE" = "t6mp" ]; then
    MODE_PATH=/server/game/Multiplayer
else
    MODE_PATH=/server/game/Zombie
fi
CFG=dedicated.cfg

cd /server/plutonium

ZONE_PATH="${MODE_PATH}/zone"
ln -sf /server/game/zone "${ZONE_PATH}"
wine .\\bin\\plutonium-bootstrapper-win32.exe $MODE $MODE_PATH -dedicated +start_map_rotate +set key $KEY +set net_port $PORT +set sv_config $CFG
