#!/bin/bash
if ! hash awesome 2>/dev/null;then
  if [ "$EUID" -ne 0 ];then
    sudo /bin/bash "$0"
  else
    apt-get install -y xorg xdm awesome libcairo2-dev xscreensaver docker.io acpi alsa libxss1 libappindicator1 libindicator7
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    dpkg -i google-chrome*.deb
    apt-get install -fy
    rm -rf google-chrome*.deb
    echo "Please Update:"
    echo " - /etc/X11/xdm/Xresources"
    echo " - /etc/modprobe.d/alsa-base.conf"
  fi
fi
