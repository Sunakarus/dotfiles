#! /bin/bash

# Ensure only one running script at a time
if [ $(pidof -x set_brightness.sh| wc -w) -gt 2 ]; then 
    exit
fi

step=10
fade_time=100
if [ "$1" == "up" ]
then
    xbacklight -inc $step -time $fade_time
elif [ "$1" == "down" ]
then
    xbacklight -dec $step -time $fade_time
elif [ "$1" == "max" ]
then
    xbacklight -set 100 -time $fade_time
elif [ "$1" == "min" ]
then
    xbacklight -set 5 -time $fade_time
fi

bl=$(xbacklight | xargs printf "%.*f\n" 0)

color="#F7C600"
col="%{F$color}"
end="%{F-}"
msg=""

if (( 0 <= $bl && $bl <= 9))
then
    msg="$col•$end○○○○○○○○○"
elif (( 10 <= $bl && $bl <= 19))
then
    msg="$col••$end○○○○○○○○"
elif (( 20 <= $bl && $bl <= 29))
then
    msg="$col•••$end○○○○○○○"
elif (( 30 <= $bl && $bl <= 39))
then
    msg="$col••••$end○○○○○○"
elif (( 40 <= $bl && $bl <= 49))
then
    msg="$col•••••$end○○○○○"
elif (( 50 <= $bl && $bl <= 59))
then
    msg="$col••••••$end○○○○"
elif (( 60 <= $bl && $bl <= 69))
then
    msg="$col•••••••$end○○○"
elif (( 70 <= $bl && $bl <= 79))
then
    msg="$col••••••••$end○○"
elif (( 80 <= $bl && $bl <= 89))
then
    msg="$col•••••••••$end○"
elif (( 90 <= $bl && $bl <= 100))
then
    msg="$col••••••••••$end"
fi

msg="TBrightness: $bl $msg"

echo "$msg" >> $PANEL_FIFO
