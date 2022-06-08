#!/usr/bin/env sh

cd $HOME/GIT/i3lock-color
chmod +x ./install-i3lock-color.sh
./install-i3lock-color.sh

cd $HOME/GIT/betterlockscreen
chmod u+x ./betterlockscreen
sudo cp ./betterlockscreen /usr/local/bin/

sudo cp ./system/betterlockscreen@.service /usr/lib/systemd/system/
sudo systemctl enable betterlockscreen@$USER
