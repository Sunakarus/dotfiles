#! /bin/bash
if [ -z $(pgrep -x Xdialog) ]
then
    USER=$(whoami)
    DIALOG=Xdialog
    $DIALOG --allow-close\
            --stdout\
            --title 'Exit'\
            --menu 'Choose action..'\
                    15 50 10 \
                    'Log out' "" \
                    'Shutdown' "" \
                    'Reboot' "" \
                    1> /tmp/exitval.$$ 2> /dev/null

    ACTION=`cat /tmp/exitval.$$`
    rm -f /tmp/exitval.$$

    case $ACTION in
        'Log out') pkill mpd && bspc quit ;;
        'Shutdown') shutdown now ;;
        'Reboot') reboot ;;
        *) exit ;;
    esac
else
    pkill Xdialog
fi
