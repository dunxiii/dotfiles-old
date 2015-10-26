#!/bin/bash

user=$(w -sh | grep tty$(fgconsole) | awk '{ print $1 }')

lock() {
    i3lock -i /home/$user/Pictures/wallpaper.png
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
