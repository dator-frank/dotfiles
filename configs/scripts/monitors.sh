#!/bin/sh
# A simple script to manage my screens.
# TODO: Modularise and make it not so shitty.
# - F. H.

display_usage() {
  echo -n "Usage: $0 [Primary State] [Secondary State] [TV State]\n\n
          States:\n
          Primary: on, 144, off\n
          Secondary: on, off\n
          TV: on, 4k, off\n\n
          The 'on' state can also be considered its default state. Any other state keeps the current setting for that screen.\n
          Example: on off -"
}

PRIMARY=DisplayPort-0
SECONDARY=DVI-D-1
TV=HDMI-A-0

RES_1080=1920x1080
RES_4K=4096x2160

case $1 in
  # Default mode
  on)
    xrandr --output $PRIMARY --primary --mode $RES_1080 --pos 0x0 ;; 
  
  144)
    xrandr --output $PRIMARY --primary --mode $RES_1080 --pos 0x0 --rate 144 ;;

  off)
    xrandr --output $PRIMARY --off ;;
  
  *)
    ;;
esac

case $2 in
  on)
    xrandr --output $SECONDARY --mode $RES_1080 --pos 1920x0 ;; 
  
  off)
    xrandr --output $SECONDARY --off ;;
  
  *)
    ;;
esac

case $3 in
  on)
    xrandr --output $TV --mode $RES_1080 --pos 3840x0 ;; 
  
  4k)
    xrandr --output $TV --mode $RES_4K --pos 3840x0 --rate 30 --scale 0.5x0.5 ;;

  off)
    xrandr --output $TV --off ;;
  
  *)
    ;;
esac

# Restart polybar to make sure the bars end up on the right screen
sleep 1
exec ${HOME}/.config/polybar/launch.sh >/dev/null 2>&1

exit 0
