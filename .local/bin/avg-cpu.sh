#!/usr/bin/env -S zsh
echo $(echo "scale=2;" "(" $(/usr/bin/cat /sys/devices/system/cpu/cpufreq/policy*/scaling_cur_freq | tr "\n" " " | sed -E "s/ / + /g") 0 ")" / "(" 1048576 "*" $(nproc --all) ")" | bc)GHz
