#!/usr/bin/env -S bash --norc

sudo sudo > /dev/null 2>&1
echo "[INFO] CPU Power table"
sudo /home/dc/GIT/RyzenAdj/build/ryzenadj -i
echo
echo "[INFO] Laptop performance mode"
sudo /home/dc/GIT/battmngr/battmngr -r
echo
echo "[INFO] Battery mode"
sudo /home/dc/GIT/battmngr/battmngr -rc
