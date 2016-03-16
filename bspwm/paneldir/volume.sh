#! /bin/bash
if [ -z $(pgrep -x pavucontrol) ]
then
    pavucontrol
else
    pkill pavucontrol
fi
