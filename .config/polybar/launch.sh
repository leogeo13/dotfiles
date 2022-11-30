#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can use 
#polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
#echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
#polybar top 2>&1 | tee -a /tmp/polybar1.log & disown

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar top -c $(dirname $0)/config.ini &

if [[ $(xrandr -q | grep 'HDMI-1 connected') ]]; then
	polybar external -c $(dirname $0)/config.ini &
fi
