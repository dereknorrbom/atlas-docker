#!/bin/sh
GREEN='\033[0;32m'
NC='\033[0m' # No Color
echo "${GREEN}Logging into Steam anonymously to download/update/validate base Atlas server files \n THIS WILL TAKE A WHILE${NC}"
steamcmd +login anonymous +force_install_dir /home/steam +app_update 1006030 validate +exit
