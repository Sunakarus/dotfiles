#! /bin/bash
step=5
case "$1" in
    up)
        amixer set Master $step%+ -M
        ;;
    down)
        amixer set Master $step%- -M
        ;;
    toggle)
        amixer set Master toggle
        ;;
esac

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

echo "$vol" >> "$PANEL_FIFO"
