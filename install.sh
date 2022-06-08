#!/usr/bin/env sh

echo "ln -s $(pwd)/.bar.sh $HOME/.bar.sh"
ln -s $(pwd)/.bar.sh $HOME/.bar.sh
echo "ln -s $(pwd)/.profile $HOME/.profile"
ln -s $(pwd)/.profile $HOME/.profile
echo "ln -s $(pwd)/.zshrc $HOME/.zshrc"
ln -s $(pwd)/.zshrc $HOME/.zshrc
echo "ln -s $(pwd)/.vimrc $HOME/.vimrc"
ln -s $(pwd)/.vimrc $HOME/.vimrc
echo "ln -s $(pwd)/.tmux.conf $HOME/.tmux.conf"
ln -s $(pwd)/.tmux.conf $HOME/.tmux.conf
echo "ln -s $(pwd)/.xbindkeysrc $HOME/.tmux.conf"
ln -s $(pwd)/.xbindkeysrc $HOME/.tmux.conf

echo "mkdir -p $HOME/.local/bin/"
mkdir -p $HOME/.local/bin/

echo "cp $(pwd)/.local/bin/* $HOME/.local/bin/"
cp $(pwd)/.local/bin/* $HOME/.local/bin/

echo "mkdir -p $HOME/.config/wal/templates/"
mkdir -p $HOME/.config/wal/templates/

echo "cp $(pwd)/.config/wal/templates/* $HOME/.config/wal/templates/"
cp $(pwd)/.config/wal/templates/* $HOME/.config/wal/templates/

echo "mkdir -p $HOME/.config/rofi/"
mkdir -p $HOME/.config/rofi/

echo "cp $(pwd)/.config/rofi/* $HOME/.config/rofi/"
cp $(pwd)/.config/rofi/* $HOME/.config/rofi/

echo "mkdir -p $HOME/.config/polybar/"
mkdir -p $HOME/.config/polybar/

echo "cp $(pwd)/.config/polybar/* $HOME/.config/polybar/"
cp $(pwd)/.config/polybar/* $HOME/.config/polybar/
