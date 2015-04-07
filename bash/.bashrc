#: Date         : 21-03-2015
#: Author       : Jack Söderblom 
#: Description  : Extra functionality for Bash shell, source this file in ~/.bashrc

# Color prompt
force_color_prompt=yes

# Alias
#######

# parrent dir
alias ..='cd ..'
# return value
alias ?='echo $?'
# vim as sudo
alias svim='sudo vim'
# -tabbed columns
alias mount='mount | column -t'
# -parrent -verbose
alias mkdir='mkdir -pv'
# colordiff instead of diff
alias diff='colordiff'

## Sudo fixes
if [ $UID -ne 0 ]; then
	alias update='sudo apt-get update && sudo apt-get upgrade'
	alias install='sudo apt-get install'
	alias remove='sudo apt-get remove'
fi

# Brightness
alias bup='xbacklight -steps 1 -time 0 -inc 15'
alias bdown='xbacklight -steps 1 -time 0 -dec 15'

## Functions

# Notes

n(){
	vim ~/notes/"$*".txt
}

nls(){
	ls -c ~/notes | grep "$*"
}



