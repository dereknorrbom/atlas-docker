#!/usr/bin/env bash
echo "###########################################################################"
echo "# Atlas Server - " `date`
echo "# UID $UID - GID $GID"
echo "###########################################################################"
[ -p /tmp/FIFO ] && rm /tmp/FIFO
mkfifo /tmp/FIFO

#export TERM=linux
