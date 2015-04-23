#!/bin/bash

# Get the ID of the focused window
window_id=$(xdpyinfo | grep focus | cut -f4 -d " ")

# Get the name of the window that has focus
window_class=$(xprop -id ${window_id} | grep WM_CLASS | cut -f4 -d "\"")

# Loop untill all agruments have been matched against the window name
for application in $*
do
	# If current window is in the Allow list
	if [ ${window_class} == ${application} ]; then
		touchpad.sh "enable"
	else
		touchpad.sh "disable"
	fi
done
exit 0
