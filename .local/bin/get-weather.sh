#!/usr/bin/env sh

weather=$(curl v2.wttr.in/?format="%l:+%C+(%t)" 2>/dev/null)
if [ ! -n "echo ${weather} | grep '<!DOCTYPE'" ]; then
    echo ${weather}
fi
