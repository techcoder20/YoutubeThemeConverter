#!/bin/bash
RED='\033[0;31m'
NC='\033[0m' 

printf "${RED}THIS SCRIPT WILL REVERT BACK THE SYSTEM TO THE DEFAULT RASPBERRY PI OS THEME AND NOT THE THEME WHEN YOU RAN THE CONVERTER SCRIPT${NC}\n"
read -n 1 -s -r -p "IF THATS WHAT YOU WANT PRESS ANY BUTTON OF CLICK ctrl+z TO EXIT: "
echo " "


sudo rm -r /home/pi/.config/lxpanel
sudo rm -r /home/pi/.config/lxterminal
sudo rm -r /home/pi/.config/lxsession
pcmanfm --set-wallpaper=/usr/share/rpd-wallpaper/temple.jpg
sudo rm /home/pi/.config/autostart/compton.desktop
sudo rm /home/pi/.config/autostart/plank.desktop
sudo rm /home/pi/.config/autostart/xfwm4.desktop



read -n 1 -s -r -p "YOUR SYSTEM WILL REBOOT NOW PRESS ANY KEY"
sudo reboot now