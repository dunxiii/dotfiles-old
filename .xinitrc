# Set keymap for X11
setxkbmap se

# Disable Caps Lock and make it Ctrl instead
xmodmap -e "remove Lock = Caps_Lock"
xmodmap -e "keysym Caps_Lock = Control_L"
xmodmap -e "add Control = Control_L"

# Startup applications
exec feh --bg-scale ~/Pictures/wallpaper.png &
exec insync start &
exec nm-applet &
exec devmon &
exec syndaemon -dtki 1 &
exec redshift -l 55.586:13.054 &

exec i3
