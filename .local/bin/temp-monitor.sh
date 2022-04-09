#!/usr/bin/env zsh

while true; do
    if [[ "$(sensors | grep edge | awk '{print $2}' | tr '+°C' ' ')" -gt 65 ]];
    then
        ec4Linux enable
        sleep 10
        ec4Linux disable
        while [[ "$(sensors | grep edge | awk '{print $2}' | tr '+°C' ' ')" -gt 50 ]] && [[ "$(sensors | grep edge | awk '{print $2}' | tr '+°C' ' ')" -lt 65 ]]; do
            sleep 1
        done
    fi
    sleep 5;
done
