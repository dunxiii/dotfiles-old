xrdb ~/.Xresources

# Here for testing purposes
which VBoxClient-all && VBoxClient-all

setxkbmap se

killall gpg-agent
eval $(gpg-agent --daemon)

~/.i3/create_config.sh
exec i3
