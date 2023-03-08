#!/usr/bin/env bash
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --config=/home/dc/.config/polybar/config --reload example &
  done
else
  polybar --config=/home/dc/.config/polybar/config --reload example &
fi
