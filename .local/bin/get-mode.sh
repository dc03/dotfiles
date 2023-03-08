#!/usr/bin/env -S bash --norc

sudo sudo > /dev/null 2>&1
echo "[INFO] CPU Power table"
sudo $HOME/GIT/RyzenAdj/build/ryzenadj -i
echo
echo "[INFO] Laptop performance mode"
sudo $HOME/GIT/battmngr/battmngr -r
echo
echo "[INFO] Battery mode"
sudo $HOME/GIT/battmngr/battmngr -rc
