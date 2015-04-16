#!/usr/bin/env bash

if synclient -l | egrep "TouchpadOff.*= *0" ; then
	synclient touchpadoff=1
else
	synclient touchpadoff=0
fi

if synclient -l | egrep "ClickPad.*= *0" ; then
	synclient clickpad=1
else
	synclient clickpad=0
fi
