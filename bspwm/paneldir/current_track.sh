#! /bin/bash
if [ $(pgrep -xo spotify) ]
then
    track=$(python2 ./.config/bspwm/paneldir/spotify.py)
fi

if [[ -z $track ]]
then
    if [ $(pgrep -x mpd) ]
    then
        track=$(mpc current)
        if [[ -z $track ]]
        then
            echo ""
        elif [[ -n $(mpc status | grep paused) ]]
        then
            track="$track " #paused
        else
            track="$track " #playing
        fi
    else
        echo "MPD off"
    fi
else
    track="$track " #spotify
fi

# truncate tracks that are too long
if [ ${#track} -ge 1 ]
then
    maxlen=60
    if [ ${#track} -ge $maxlen ]
    then
        track=${track:${#track}-$maxlen:$maxlen}
        track="...$track"
    fi
    echo $track
fi
