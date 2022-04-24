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


redshift -m randr > /dev/null 2>&1 &
feh --bg-fill "/home/dc/Pictures/Wallpapers/4roxk1nqz4911.png"
wal -i "/home/dc/Pictures/Wallpapers/4roxk1nqz4911.png"
picom&
flameshot&
xset +fp /home/dc/.local/share/fonts
xset fp rehash
~/.local/bin/temp-monitor.sh > /dev/null 2>&1 &
xbindkeys&
dunst&
TOUCHPAD_ID=$(xinput list | grep Touchpad | awk '{print $6}' | tr '=' ' ' | awk '{print $2}')
xinput set-prop ${TOUCHPAD_ID}  "libinput Natural Scrolling Enabled" 1
xinput set-prop ${TOUCHPAD_ID} "libinput Tapping Enabled" 1
export _JAVA_AWT_WM_NONREPARENTING=1

. "$HOME/.cargo/env"

setxkbmap -layout us,apl -variant ,dyalog -option grp:win_switch
