#!/usr/bin/env sh

weather=$(curl v2.wttr.in/?format="%c" 2>/dev/null)
if [ ! -n "$(echo ${weather} | grep '<!DOCTYPE')" ]; then
    echo ${weather}
fi
#echo hello world
