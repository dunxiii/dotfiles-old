# Set keymap for X11
setxkbmap se

# Merge Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources


# Startup applications
#exec --no-startup-id feh --bg-scale ~/Insync/Bilder/0dnZS6U.jpg
exec insync start &
exec gnome-terminal --zoom=0.8 --role=systemd-logg -e "/bin/zsh -c 'journalctl -af --no-tail'" &





#exec --no-startup-id skype &
#exec --no-startup-id virtualbox &
#exec --no-startup-id pa-applet &
#exec --no-startup-id devmon &
#exec --no-startup-id xflux -l 55.5864 -g 13.0546 &
#exec --no-startup-id sysdaemon -dtki 1 &




exec i3
