#!/bin/sh
# A simple script to manage my screens.
# TODO: Modularise and make it not so shitty.
# - F. H.

display_usage() {
  echo -n "Usage: $0 [Primary State] [Secondary State] [TV State]\n\n
          States:\n
          DP: on, 120, 144, off\n
          HDMI: on, 4k, off\n
          "
}

DP=DisplayPort-0
HDMI=HDMI-A-0

RES_1080=1920x1080
RES_1440=2560x1440
RES_4K=3840x2160

case $1 in
  # Default mode
  on)
    xrandr --output $DP --primary --mode $RES_1080 --pos 0x0 ;; 
 
  120)
    xrandr --output $DP --primary --mode $RES_1080 --pos 0x0 --rate 120 ;;

  144)
    xrandr --output $DP --primary --mode $RES_1080 --pos 0x0 --rate 144 ;;

  off)
    xrandr --output $DP --off ;;
  
  *)
    ;;
esac

case $2 in
  on)
    xrandr --output $HDMI --mode $RES_1080 --pos 1920x0 --rate 60 --scale 1 ;; 
  
  1440)
    xrandr --output $HDMI --mode $RES_1440 --pos 1920x0 --rate 30 --scale 1 ;;
  
  4k)
    xrandr --output $HDMI --mode $RES_4K --pos 1920x0 --rate 30 --scale 0.5x0.5 --filter nearest ;;

  off)
    xrandr --output $HDMI --off ;;
  
  *)
    ;;
esac

# Restart polybar to make sure the bars end up on the right screen
# sleep 1
# exec ${HOME}/.config/polybar/launch.sh >/dev/null 2>&1

exit 0
