#!/bin/bash

# Constants
readonly path="/sys/class/leds/asus::kbd_backlight"

# Sets correct permissions to a system file
# users can change keyboard light
set_permission() {
    if [ -f ${path}/brightness ]; then
        if [ ${UID} -eq 0 ]; then
            chmod o+wx ${path}/brightness
        else
            echo "You don't have the right permissions" >&2
            exit 1
        fi
    else
        echo "System file does not exist" >&2
        exit 1
    fi
}

# This funtion change the brightness of the keyboard light
# by changing a singel interger in a system file
set_brightness() {

    # Controll if the current user has write permission to the system file
    if [ ! -w ${path}/brightness ]; then
        echo "You don't have the right permissions" >&2
        exit 1
    fi

    # If there is a file for max brightness we are ready to change the value of brightness
    if [ -f ${path}/max_brightness ]; then
        # Get values from system files
        max=$(cat ${path}/max_brightness)
        current=$(cat ${path}/brightness)

        case $1 in
            up)
                if [ ${current} -lt ${max} ]; then
                    ((current+=1))
                    echo ${current} > ${path}/brightness
                fi
            ;;
            down)
                if [ ${current} -gt 0 ]; then
                    ((current-=1))
                    echo ${current} > ${path}/brightness
                fi
            ;;
        esac
    else
        echo "System file missing" >&2
        exit 1
    fi
}

print_help() {
    echo ""
    echo "This script is used to controll the keyboard light on asus zenbook"
    echo "------------------------------------------------------------------"
    echo "Flags are:"
    echo "-p = Sets the correct permisson on a necessary system file, need root privileges"
    echo "-u = Increase the brightness one step"
    echo "-d = Decrease the brightness one step"
    echo "-h = Prints this help text"
    echo ""
}

while getopts :pudh option; do
    case $option in
        p) set_permission ;;
        u) set_brightness up ;;
        d) set_brightness down ;;
        h) print_help ;;
        ?) echo "${OPTARG} is not a valid flag option!" >&2
           exit 1
           ;;
    esac
done

exit 0
