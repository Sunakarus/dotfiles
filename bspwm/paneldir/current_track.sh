#! /bin/bash

track=$(mpc current)
if [[ -z $track ]]
then
    echo ""
    exit 0
elif [[ -n $(mpc status | grep paused) ]]
then
    track="$track " #paused
else
    track="$track " #playing
fi
echo "$track"
