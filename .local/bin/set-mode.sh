#!/usr/bin/env -S bash --norc

function ask_mode {
    printf "[INFO] Mode: "
    sudo /home/dc/GIT/battmngr/battmngr -r
    echo "[INFO] Please use Fn + Q to set mode and press enter when done"
    read _unused
    sudo /home/dc/GIT/battmngr/battmngr -r
}

function ryzenadj_low {
    echo "[INFO] Executing ryzenadj to low preset [--slow-time=60 --tctl-temp=60 --stapm-limit=10000 --stapm-time=600 --fast-limit=15000 --slow-limit=7000]"
    sudo /home/dc/GIT/RyzenAdj/build/ryzenadj --slow-time=60 --tctl-temp=60 --stapm-limit=10000 --stapm-time=600 --fast-limit=15000 --slow-limit=7000
}

function ryzenadj_med {
    echo "[INFO] Executing ryzenadj to medium preset [--slow-time=60 --tctl-temp=80 --stapm-limit=15000 --stapm-time=900 --fast-limit=25000 --slow-limit=20000]"
    sudo /home/dc/GIT/RyzenAdj/build/ryzenadj --slow-time=60 --tctl-temp=80 --stapm-limit=15000 --stapm-time=900 --fast-limit=25000 --slow-limit=20000
}

function ryzenadj_high {
    echo "[INFO] Executing ryzenadj to high preset [--slow-time=60 --tctl-temp=80 --stapm-limit=45000 --stapm-time=900 --fast-limit=55000 --slow-limit=40000]"
    sudo /home/dc/GIT/RyzenAdj/build/ryzenadj --slow-time=60 --tctl-temp=80 --stapm-limit=45000 --stapm-time=900 --fast-limit=55000 --slow-limit=40000
}

function set_low {
    ask_mode
    ryzenadj_low
    sudo cpupower frequency-set --governor powersave
    sudo cpupower frequency-set --max 1.40GHz
    light -S 15
}

function set_med {
    ask_mode
    ryzenadj_med
    sudo cpupower frequency-set --governor schedutil
    sudo cpupower frequency-set --max 1.70GHz
    light -S 25
}

function set_high {
    ask_mode
    ryzenadj_high
    sudo cpupower frequency-set --governor schedutil
    sudo cpupower frequency-set --max 2.90GHz
    light -S 35
}

case $1 in
    "low")
        sudo /home/dc/.local/bin/cpumgr.sh 8 offline
        set_low
        ;;
    "med")
        sudo /home/dc/.local/bin/cpumgr.sh 8 online
        set_med
        ;;
    "high")
        sudo /home/dc/.local/bin/cpumgr.sh 8 online
        set_high
        ;;
    "low_16")
        set_low
        ;;
    "med_16")
        set_med
        ;;
    "high_16")
        set_high
        ;;
    *)
        echo "Usage: $0 [option]"
        echo
        echo "option: low, med, high, low_16, med_16, high_16"
        ;;
esac
