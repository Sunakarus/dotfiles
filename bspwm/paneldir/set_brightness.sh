#! /bin/bash

# Ensure only one running script at a time
if [ $(pidof -x set_brightness.sh | wc -w) -gt 2 ]; then 
    exit
fi

# Brightness percent to reduce/increase
step=10
# Time in miliseconds for brightness to change
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
    msg="$col  •$end○○○○○○○○○"
elif (( $bl == 10))
then
    msg="$col •$end○○○○○○○○○"
elif (( 11 <= $bl && $bl <= 20))
then
    msg="$col ••$end○○○○○○○○"
elif (( 21 <= $bl && $bl <= 30))
then
    msg="$col •••$end○○○○○○○"
elif (( 31 <= $bl && $bl <= 40))
then
    msg="$col ••••$end○○○○○○"
elif (( 41 <= $bl && $bl <= 50))
then
    msg="$col •••••$end○○○○○"
elif (( 51 <= $bl && $bl <= 60))
then
    msg="$col ••••••$end○○○○"
elif (( 61 <= $bl && $bl <= 70))
then
    msg="$col •••••••$end○○○"
elif (( 71 <= $bl && $bl <= 80))
then
    msg="$col ••••••••$end○○"
elif (( 81 <= $bl && $bl <= 90))
then
    msg="$col •••••••••$end○"
elif (( 91 <= $bl && $bl <= 100))
then
    msg="$col••••••••••$end"
fi

msg="TBrightness: $bl $msg"

echo "$msg" >> $PANEL_FIFO
