#!/bin/bash

#-------------------------------------------------------------------------------
# Author: Jack Söderblom
# Description: Uses rofi as an power settings menu

# Revision history:
#   8 feb 2016 16:04:55
#   Created script.

# If script is large make -h option
# Use curly brackets arround variables
# ------------------------------------------------------------------------------

user=$(w -sh | grep tty$(fgconsole 2>/dev/null) | awk '{ print $1 }')

# If used from cmd directly set user var correctly
if [ -z ${user} ]
then
    user=${USER}
fi

# Lock function
lock() {
    i3lock -i /home/$user/Pictures/wallpaper.png
}

# Menu to print on screen
# sed string removes leading whitespace only
selection=$(
    echo \
        "1) lock
        2) logout
        3) poweroff
        4) reboot
        5) reboot to UEFI
        6) suspend"\
    | sed -e 's/^[[:space:]]*//' \
    | rofi -dmenu -auto-select -fullscreen -p "Power option:"
)

# What to execute
case "${selection}" in
    "1) lock")
        $(lock)
        ;;
    "2) logout")
        $(i3-msg exit)
        ;;
    "3) poweroff")
        $(lock && systemctl suspend)
        ;;
    "4) reboot")
        $(systemctl reboot)
        ;;
    "5) reboot to UEFI")
        $(systemctl reboot --firmware-setup)
        ;;
    "6) suspend")
        $(systemctl poweroff)
        ;;
    *)
        exit 1
        ;;
esac

exit
