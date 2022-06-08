#!/usr/bin/env sh

do_install() {
    cd $HOME/GIT/$1
    sudo make install
}

do_install dwm
do_install dwm-gnome
do_install dmenu
do_install st

cd $HOME/GIT/polybar-dwm-module
chmod +x ./build.sh
./build.sh