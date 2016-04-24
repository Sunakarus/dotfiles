#! /bin/bash
if [ -z $(pgrep -x ncmpcpp) ]
then
    uxterm -e ncmpcpp
else
    pkill ncmpcpp
fi
