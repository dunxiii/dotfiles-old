~/.screenlayout/default.sh

# This command can only be run here to be system wide
killall gpg-agent
eval $(gpg-agent --daemon)

exec i3
