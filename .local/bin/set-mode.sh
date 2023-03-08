#!/usr/bin/env -S bash --norc

function enable-cpu-boost() {
    echo "1" | sudo tee /sys/devices/system/cpu/cpufreq/boost
}

function disable-cpu-boost() {
    echo "0" | sudo tee /sys/devices/system/cpu/cpufreq/boost
}

function ask_mode {
    sudo sudo > /dev/null 2>&1
    printf "[INFO] Mode: "
    sudo $HOME/GIT/battmngr/battmngr -r
    echo "[INFO] Please use Fn + Q to set mode and press enter when done"
    read _unused
    sudo $HOME/GIT/battmngr/battmngr -r
}

function ryzenadj_low {
    echo "[INFO] Executing ryzenadj to low preset [--slow-time=60 --tctl-temp=60 --stapm-limit=10000 --stapm-time=600 --fast-limit=15000 --slow-limit=7000]"
    sudo $HOME/GIT/RyzenAdj/build/ryzenadj --slow-time=60 --tctl-temp=60 --stapm-limit=10000 --stapm-time=600 --fast-limit=15000 --slow-limit=7000
}

function ryzenadj_med {
    echo "[INFO] Executing ryzenadj to medium preset [--slow-time=60 --tctl-temp=80 --stapm-limit=15000 --stapm-time=900 --fast-limit=25000 --slow-limit=20000]"
    sudo $HOME/GIT/RyzenAdj/build/ryzenadj --slow-time=60 --tctl-temp=80 --stapm-limit=15000 --stapm-time=900 --fast-limit=25000 --slow-limit=20000
}

function ryzenadj_high {
    echo "[INFO] Executing ryzenadj to high preset [--slow-time=60 --tctl-temp=80 --stapm-limit=45000 --stapm-time=900 --fast-limit=55000 --slow-limit=40000]"
    sudo $HOME/GIT/RyzenAdj/build/ryzenadj --slow-time=60 --tctl-temp=80 --stapm-limit=45000 --stapm-time=900 --fast-limit=55000 --slow-limit=40000
}

function set_low {
    ask_mode
    ryzenadj_low
    sudo cpupower frequency-set --governor powersave
    sudo cpupower frequency-set --max 1.40GHz
    disable-cpu-boost
#    light -S 15
}

function set_med {
    ask_mode
    ryzenadj_med
    sudo cpupower frequency-set --governor schedutil
    sudo cpupower frequency-set --max 1.70GHz
    enable-cpu-boost
#    light -S 25
}

function set_high {
    ask_mode
    ryzenadj_high
    sudo cpupower frequency-set --governor schedutil
    sudo cpupower frequency-set --max 2.90GHz
    enable-cpu-boost
#    light -S 35
}

function print_usage {
    echo "Usage: $0 [TYPE] [ARGUMENT]"
    echo ""
    echo "TYPE: cpu, battery, charge"
    echo ""
    echo "ARGUMENT:"
    echo "    cpu:     low, med, high, low_8, med_16, high_16"
    echo "    battery: conserve [on, off], rapid [on, off]"
    echo "    charge:  rapid, hold"
}

case $1 in
    "cpu")
        case $2 in
            "low")
                sudo $HOME/.local/bin/cpumgr.sh 16 online
                set_low
                ;;
            "med")
                sudo $HOME/.local/bin/cpumgr.sh 16 online
                set_med
                ;;
            "high")
                sudo $HOME/.local/bin/cpumgr.sh 16 online
                set_high
                ;;
            "low_8")
                sudo $HOME/.local/bin/cpumgr.sh 8 offline
                set_low
                ;;
            "med_16")
                set_med
                ;;
            "high_16")
                set_high
                ;;
            *)
                print_usage
                ;;
        esac
        ;;
    "battery")
        case $2 in
            "conserve")
                case $3 in
                    "on")
                        sudo sh -c 'echo 1 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004\:00/conservation_mode'
                        sudo $HOME/GIT/battmngr/battmngr -rc
                        ;;
                    "off")
                        sudo sh -c 'echo 0 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004\:00/conservation_mode'
                        sudo $HOME/GIT/battmngr/battmngr -rc
                        ;;
                    *)
                        print_usage
                        ;;
                esac
                ;;
            "rapid")
                case $3 in
                    "on")
                        sudo $HOME/GIT/battmngr/battmngr -sc 1
                        sudo $HOME/GIT/battmngr/battmngr -rc
                        ;;
                    "off")
                        sudo $HOME/GIT/battmngr/battmngr -sc 2
                        sudo $HOME/GIT/battmngr/battmngr -rc
                        ;;
                    *)
                        print_usage
                        ;;
                esac
                ;;
            *)
                print_usage
                ;;
        esac
        ;;
    "charge")
        case $2 in
            "rapid")
                $HOME/.local/bin/set-mode.sh battery rapid on
                $HOME/.local/bin/set-mode.sh battery conserve off
                ;;
            "hold")
                $HOME/.local/bin/set-mode.sh battery rapid off
                $HOME/.local/bin/set-mode.sh battery conserve on
                ;;
            *)
                print_usage
                ;;
        esac
        ;;
    *)
        print_usage
        ;;
esac
