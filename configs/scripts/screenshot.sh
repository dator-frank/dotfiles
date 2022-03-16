#!/bin/sh 
name=~/pictures/screenshots/screenshot-$(date +%F_%T).png
maim -s | tee $name | xclip -selection clipboard -t image/png -i 
notify-send Bopped $name
