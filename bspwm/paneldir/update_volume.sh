#! /bin/bash
step=5
if [ "$1" == "up" ]
then
    amixer set Master $step%+ -M
elif [ "$1" == "down" ]
then
    amixer set Master $step%- -M
elif [ "$1" == "toggle" ]
then
    amixer set Master toggle
fi

#ALSA_VOLUME=$(amixer -c 1 get Master | grep 'Mono: Playback' | grep -o '...%' | sed 's/\[//' | sed 's/%//' | sed 's/ //')
ALSA_VOLUME=$(amixer get Master | grep 'Left: Playback' | grep -o '...%' | sed 's/\[//' | sed 's/%//' | sed 's/ //')
ALSA_STATE=$(amixer get Master | grep 'Left: Playback' | grep -o '\[on]')
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
