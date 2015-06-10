#!/bin/bash

# Copy repository from github
git -C /tmp clone https://github.com/lassekongo83/zuki-themes.git

# Copy theme to system
cp -r /tmp/zuki-themes/Zukitre /usr/share/themes

# Install dependencys if needed
pacman -Qs gtk-engines
[ $? -eq 1 ] && pacman -S gtk-engines

pacman -Qs gtk-engine-murrine
[ $? -eq 1 ] && pacman -S gtk-engine-murrine

# Cleanup
rm -r /tmp/zuki-themes

# Set GTK+ style for QT applications
[ -f ~/.config/Trolltech.conf ] && sed -i 's/style=.*/style=GTK+/' ~/.config/Trolltech.conf
