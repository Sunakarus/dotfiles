#! /bin/bash
step=5
if [ "$1" == "up" ]
then
    xbacklight -inc $step
elif [ "$1" == "down" ]
then
    xbacklight -dec $step
fi

bl=$(xbacklight | cut -d'.' -f1)

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
