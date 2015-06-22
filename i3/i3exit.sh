#!/bin/bash

function lock {
    # Dependencies:
    # imagemagick
    # i3lock-color-git
    # scrot

    IMAGE=/tmp/i3lock.png
 
    # All options are here: http://www.imagemagick.org/Usage/blur/#blur_args
    BLURTYPE="0x5" # 7.52s

    # List fonts with command "convert -list font"

    scrot $IMAGE
    convert $IMAGE -level 0%,100%,0.6 -blur $BLURTYPE -font Inconsolata-for-Powerline -pointsize 26 -fill white -gravity center - | composite -gravity center lock.png - $IMAGE
    i3lock --textcolor=ffffff00 --insidecolor=ffffff1c --ringcolor=ffffff3e --linecolor=ffffff00 --keyhlcolor=00000080 --ringvercolor=00000000 --insidevercolor=0000001c --ringwrongcolor=00000055 --insidewrongcolor=0000001c -i $IMAGE

    #convert $IMAGE -level 0%,100%,0.6 -blur $BLURTYPE -font Inconsolata-for-Powerline -pointsize 26 -fill white -gravity center -annotate +0+200 'Type password to unlock' - | composite -gravity center lock.png - $IMAGE
    #i3lock --textcolor=ffffff00 --insidecolor=ffffff1c --ringcolor=ffffff3e --linecolor=ffffff00 --keyhlcolor=00000080 --ringvercolor=00000000 --insidevercolor=0000001c --ringwrongcolor=00000055 --insidewrongcolor=0000001c  -i $IMAGE

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
        lock && systemctl suspend
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
