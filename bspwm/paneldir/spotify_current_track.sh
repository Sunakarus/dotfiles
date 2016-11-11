#! /bin/sh

function truncate_str {
    maxlen=60
    track="$1"

    if [ "${#track}" -ge $maxlen ]
    then
        track="${track:${#track}-$maxlen:$maxlen}"
        track="...$track"
    fi
    echo "$track"
}

msg="M"
stat=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'PlaybackStatus'|egrep -A 1 "string"|cut -b 26-|cut -d '"' -f 1|egrep -v ^$)

if [[ "$stat" == "Playing" ]]
then
    msg="${msg}A "
elif [[ "$stat" == "Paused" ]]
then
    msg="${msg}S "
fi

if [ $(pgrep -xo spotify) ]
then
    SPOTIFY_TRACK=$(~/.config/bspwm/paneldir/spotify.py)
    SPOTIFY_TRACK=$(truncate_str "$SPOTIFY_TRACK")

    if [[ ! -z "$SPOTIFY_TRACK" ]]
    then
        msg="${msg}${SPOTIFY_TRACK} "
    else
        msg="${msg}- "
    fi
fi

echo "$msg" >> $PANEL_FIFO
