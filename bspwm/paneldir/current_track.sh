#! /bin/bash

track=$(mpc current)
if [[ -z $track ]]
then
    echo ""
    exit 0
elif mpc status | grep -q paused
then
    track="$track " #paused
else
    track="$track " #playing
fi
echo "$track"
