#! /bin/bash

track=$(mpc current)
if [[ -z $track ]]
then
    echo ""
    exit 0
elif mpc status | grep -q paused
then
    track="\ue059 $track" #paused
else
    track="\ue058 $track" #playing
fi
echo -e "$track"
