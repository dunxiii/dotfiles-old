#!/bin/bash
# terminator -c i3exit-whiptail -e bash -c 'i3exit-whiptail.sh'

user=$(w -sh | grep tty$(fgconsole) | awk '{ print $1 }')

lock() {
    i3lock -i /home/$user/Pictures/wallpaper.png
}

options=(
    "l" "Lock"
    "o" "Logout"
    "p" "Poweroff"
    "u" "Reboot to UEFI"
    "r" "Reboot"
    "s" "Suspend"
)

selection=$(
    whiptail                    \
    --title "Power menu"        \
    --menu "Choose an option"   \
    14 30 6 "${options[@]}"     \
    3>&1 1>&2 2>&3
)

case "${selection}" in
    l)
        $(lock)
        ;;
    o)
        $(i3-msg exit)
        ;;
    s)
        $(lock && systemctl suspend)
        ;;
    r)
        $(systemctl reboot)
        ;;
    u)
        $(systemctl reboot --firmware-setup)
        ;;
    p)
        $(systemctl poweroff)
        ;;
esac

exit 0
