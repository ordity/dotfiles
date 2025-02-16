#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# I'm not sure why this line is here. I'm leaving it commented out just in case.
# echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log

if type "xrandr"; then # check if ranr exists
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do # grab monitor outputs
    MONITOR=$m polybar --reload main_bar &
  done
else
  polybar --reload main_bar &
fi

echo "Bars launched..."
