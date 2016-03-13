#! /bin/bash
if [ -z $(pgrep -x wpa_gui) ]
then
    wpa_gui -i wlp9s0
else
    pkill wpa_gui
fi
