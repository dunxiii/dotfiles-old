#!/bin/bash
# Sets correct permissions so users can change keyboard light
chmod o+x /sys/class/leds/asus\:\:kbd_backlight/brightness
