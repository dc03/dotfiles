# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

function setup {
    feh --bg-fill "$HOME/Pictures/Wallpapers/hokusai-non-prompt-landscape-ai-3840×2160.jpg"
    wal -i "$HOME/Pictures/Wallpapers/hokusai-non-prompt-landscape-ai-3840×2160.jpg"
    picom&
    flameshot&
    xset +fp $HOME/.local/share/fonts
    xset fp rehash
    ~/.local/bin/temp-monitor.sh > /dev/null 2>&1 &
    xbindkeys&
    cp ~/.cache/wal/dunstrc ~/.config/dunst/dunstrc
    dunst&
    export _JAVA_AWT_WM_NONREPARENTING=1

    #(xautolock -locker "/usr/bin/sh -c 'dunstctl set-paused true && DISPLAY=:1 /usr/local/bin/betterlockscreen --lock blur -- -n && dunstctl set-paused false'" -time 5 -killtime 10 -killer "systemctl suspend" -corners 00-- -detectsleep&)
    xset s 300
    (env XSECURELOCK_SAVER=saver_xscreensaver XSECURELOCK_SAVER=$HOME/.local/bin/flux XSECURELOCK_SHOW_DATETIME=1 xss-lock -n /usr/libexec/xsecurelock/dimmer -l -- xsecurelock &)
    (redshift-gtk -l $(curl ipinfo.io | jq '.loc' | sed 's/"//g' | sed 's/,/:/g') -m randr > /dev/null 2>&1 &)
#    (kdeconnect-indicator&)
}

TOUCHPAD_ID=$(xinput list | grep Touchpad | awk '{print $6}' | tr '=' ' ' | awk '{print $2}')
xinput set-prop ${TOUCHPAD_ID}  "libinput Natural Scrolling Enabled" 1
xinput set-prop ${TOUCHPAD_ID} "libinput Tapping Enabled" 1

. "$HOME/.cargo/env"

#setxkbmap -layout us,apl -variant ,dyalog -option grp:win_switch

setup
export SDL_JOYSTICK_HIDAPI=0


# Added by Toolbox App
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"
