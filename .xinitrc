# Set keymap for X11
setxkbmap se

# Map caps lock to esc
xmodmap -e 'clear Lock'
xmodmap -e 'keycode 0x42=Escape'

# Merge Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Startup applications
exec urxvtd &
exec feh --bg-scale ~/dunxiii@gmail.com/images/wallpappers/arch/solarized_arch_linux_by_hundone-d8pkllu.png &
exec insync start &
exec urxvt -name systemd-logg -e /bin/zsh -c "journalctl -afb" &
#exec gnome-terminal --zoom=0.8 --role=systemd-logg -e "/bin/zsh -c 'journalctl -afb'" &


#exec --no-startup-id virtualbox &
#exec --no-startup-id devmon &
#exec --no-startup-id xflux -l 55.5864 -g 13.0546 &
#exec --no-startup-id sysdaemon -dtki 1 &

exec i3
