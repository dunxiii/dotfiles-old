#!/bin/bash

function lock {
    # Dependencies:
    # imagemagick
    # scrot

    IMAGE=/tmp/i3lock.png
 
    # All options are here: http://www.imagemagick.org/Usage/blur/#blur_args
    BLURTYPE="0x5" # 7.52s

    # List fonts with command "convert -list font"

    # Take screenshot
    scrot $IMAGE

    # Add locksymbol to screenshot
    convert $IMAGE -level 0%,100%,0.6 -blur $BLURTYPE -font Inconsolata-for-Powerline -pointsize 26 -fill white -gravity center -annotate +0+200 "$user" - | composite -gravity center /home/jack/.i3/lock.png - $IMAGE

    # Lock computer with screenshot as background
    i3lock -ui $IMAGE
    rm $IMAGE
}

case "$1" in
    lock)
        lock
        ;;
    logout)
        i3-msg exit
        ;;
    suspend)
        lock
        systemctl suspend
        ;;
    reboot)
        systemctl reboot
        ;;
    poweroff)
        systemctl poweroff
        ;;
    *)
        echo "Usage: $0 {lock|logout|suspend|reboot|poweroff}"
        exit 2
esac

exit 0
