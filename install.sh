#!/bin/bash
##########################################################
# Script to link the settings from git to the right place.
##########################################################

function conf_i3 {
	mkdir -p ~/.i3
	ln -s ${PWD}/i3/config ~/.i3/config
}

conf_i3

exit 0
