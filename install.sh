#!/bin/bash
#####################################
# Script to link files from git to ~/
#####################################

function conf_i3 {
	# Make directory if there is none
	mkdir -p ~/.i3

	# Rename original files
	[ -e ~/.i3/config] && mv ~/.i3/config ~/.i3/config.bak

	# Link new files
	ln -s ${PWD}/i3/config ~/.i3/config
}

function conf_conky {
	# Make directory if there is none
	mkdir -p ~/.conky

	# Rename original files
	[ -e ~/.conky/.conky_statusbar] && mv ~/.conky/.conky_statusbar ~/.conky/.conky_statusbar.bak
	[ -e ~/.conky/.conky_init.sh] && mv ~/.conky/.conky_init.sh ~/.conky/.conky_init.sh.bak

	# Link new files
	ln -s ${PWD}/conky/.conky_statusbar ~/.conky/.conky_statusbar
	ln -s ${PWD}/conky/.conky_init.sh ~/.conky/.conky_init.sh
}

function conf_vim {
	# Make directory if there is none
	#mkdir -p ~/.vim

	# Rename original files
	[ -e ~/.vimrc ] && mv ~/.vimrc ~/.vimrc.bak

	# Link new files
	ln -s ${PWD}/vim/.vimrc ~/.vimrc
}

PS3='Please enter your choice: '
options=("i3" "conky" "vim" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "i3")
	    conf_i3
            ;;
        "conky")
            conf_conky
	    ;;
        "vim")
            conf_vim
	    ;;
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done

exit 0
