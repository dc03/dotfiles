#!/usr/bin/env sh

pkill dunst && (dunst&) && notify-send -u low help && notify-send -u normal help && notify-send -u critical help
