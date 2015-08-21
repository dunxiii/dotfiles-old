# Set keymap for X11
setxkbmap se

# Disable Caps Lock and make it Esc instead
#xmodmap -e "remove Lock = Caps_Lock"
#xmodmap -e "keysym Caps_Lock = Escape"
#xmodmap -e "add Lock = Caps_Lock"

# Disable Caps Lock and make it Ctrl instead
xmodmap -e "remove Lock = Caps_Lock"
xmodmap -e "keysym Caps_Lock = Control_L"
xmodmap -e "add Control = Control_L"

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
