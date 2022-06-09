#!/usr/bin/env sh

echo $(curl v2.wttr.in/?format="%l:+%C+(%t)" 2>/dev/null)
