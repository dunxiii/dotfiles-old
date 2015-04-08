#!/bin/bash
##########################################################
# Script to link the settings from git to the right place.
##########################################################

function conf_i3 {
	mkdir -p ~/.i3
	ln -s ${PWD}/i3/config ~/.i3/config
	return $?
}

function conf_conky {
	mkdir -p ~/.conky
	ln -s ${PWD}/conky/.conky_statusbar ~/.conky/.conky_statusbar
	ln -s ${PWD}/conky/.conky_init.sh ~/.conky/.conky_init.sh
	return $?
}


PS3='Please enter your choice: '
options=("i3" "conky" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "i3")
	    conf_i3
	    if (true); then
            	echo "Configurationfiles for i3 was linked."
	    fi
            ;;
        "conky")
            conf_conky
	    if (true); then
	    	echo "Configurationfiles for conky was linked."
            fi
	    ;;
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done

exit 0
