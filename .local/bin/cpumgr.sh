#!/usr/bin/env -S bash --norc

MAX=$(nproc --all)
if [[ $1 -eq '' ]]; then
    read -p '[INFO] No arguments given, shut down all CPUs? [Y/n]: ' answer
    if [[ ${answer} =~ ^[yY]$ ]]; then
        echo '[INFO] Okay, continuing'
        FROM=1
    elif [[ ${answer} =~ ^[nN]$ ]]; then
        echo '[INFO] Okay, exiting'
        exit 0
    else
        echo '[ERROR] Invalid input, exiting'
        exit 1
    fi
else
    FROM=$((${MAX} - $1))
fi

TO=$((${MAX} - 1))

case $2 in
    "offline")
        echo "[INFO] Turning CPUs off"
        TYPE=0;;
    "online")
        echo "[INFO] Turning CPUs on"
        TYPE=1;;
    *)
        if [[ $1 -eq '' ]]; then
            TYPE=0
        else
            echo "[ERROR] Invalid second argument, expected 'offline' or 'online'"
            exit 1
        fi;;
esac

while [[ ${FROM} -le ${TO} ]]; do
    if [[ TYPE -eq 0 ]]; then
        printf "Turning off "
    elif [[ TYPE -eq 1 ]]; then
        printf "Turning on "
    fi
    echo /sys/devices/system/cpu/cpu${FROM}
    sudo sh -c "echo ${TYPE} > /sys/devices/system/cpu/cpu${FROM}/online"
    FROM=$((${FROM} + 1))
done

