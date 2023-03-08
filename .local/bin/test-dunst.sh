#!/usr/bin/env sh

cp ~/.cache/wal/dunstrc ~/.config/dunst/dunstrc && pkill dunst && (dunst&) && notify-send -u low help && notify-send -u normal help && notify-send -u critical help

