xrdb ~/.Xresources

setxkbmap se

killall gpg-agent
eval $(gpg-agent --daemon)

~/.i3/create_config.sh
exec i3
