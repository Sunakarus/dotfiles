#! /bin/bash
step=5
if [ "$1" == "up" ]
then
    amixer -q sset Master $step%+
    sleep 0.1 #delay to make sure volume changes before checking it
elif [ "$1" == "down" ]
then
    amixer -q sset Master $step%-
    sleep 0.1 #see above
elif [ "$1" == "toggle" ]
then
    amixer set Master toggle
fi

ALSA_VOLUME=$(amixer -c 1 get Master | grep 'Mono: Playback' | grep -o '...%' | sed 's/\[//' | sed 's/%//' | sed 's/ //')
ALSA_STATE=$(amixer -c 1 get Master | grep 'Mono: Playback' | grep -o '\[on]')
vol=""

if [ "$ALSA_STATE" ]
then
    if [ "$ALSA_VOLUME" -ge 40 ]
    then
        vol="V $ALSA_VOLUME%" #volUp
    else
        vol="V $ALSA_VOLUME%" #volDown
    fi
else
    vol="V mute"
fi

echo "$vol" >> $PANEL_FIFO
