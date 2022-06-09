#!/usr/bin/env sh

echo $(curl v2.wttr.in/?format="%c" 2>/dev/null)
#echo hello world
