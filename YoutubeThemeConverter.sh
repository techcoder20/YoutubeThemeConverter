#!/bin/bash

cat < ~/YoutubeThemeConverter/assets/CoolText/YoutubeThemeConverter #Printing Text

#Initialsing Download Link Variables
ThemeLink=https://github.com/daniruiz/flat-remix-gtk.git
IconsLink=https://github.com/PapirusDevelopmentTeam/papirus-icon-theme.git
CursorsLink=https://github.com/ful1e5/Bibata_Cursor.git
WallpaperLink=https://wallpapercave.com/download/youtuber-logos-wallpapers-wp7475215?nocache=1
PlankLink=https://www.pling.com/p/1308399/
PiAppsLink=https://github.com/Botspot/pi-apps.git
PiKissLink=https://github.com/jmcerrejon/PiKISS
eDEXLink=https://github.com/GitSquared/edex-ui.git
DiscordLink=https://github.com/SpacingBat3/electron-discord-webapp


#Initialsing Coloured Text Variables
RED='\033[0;31m'
PURPLE='\033[0;35m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
GRAY='\033[0;37m'
YELLOW='\033[0;33m'
AQUA='\033[0;36m'
NC='\033[0m' 


printf "${RED}This script is made by techcoder20\n"
printf "${RED}I am not responsible if anything wrong happens${NC}\n"
printf "${RED}This script will convert your raspberry pi os to a cool Youtube theme\n"
printf "${RED}Please note that I have not made any of the Themes or Icons or Software${NC}\n"
printf "${PURPLE}Theme made by daniruiz\n"
printf "${PURPLE}Find the theme at $ThemeLink\n"
printf "${AQUA}Find the Wallpaper at $WallpaperLink${NC}\n"
printf "${BLUE}Icons made by PapirusDevelopmentTeam\n"
printf "${BLUE}Find the icons at $IconsLink ${NC}\n"
printf "${YELLOW}Cursors made by ful1e5\n"
printf "${YELLOW}Find the cursors at $CursorsLink ${NC}\n"
printf "${GREEN}Plank themes made by fkorpsvart\n"
printf "${GREEN}Find the plank theme at $PlankLink ${NC}\n"
printf "${PURPLE}Pi Apps made by botspot \n"
printf "${PURPLE}Find Pi-Apps at $PiAppsLink ${NC}\n"
printf "${AQUA}Discord app made by spacingbat \n"
printf "${AQUA}Find the Discord app at $DiscordLink ${NC}\n"
printf "${BLUE}edexui is made by Gitsquared and compiled for the pi by novaspirit tech \n"
printf "${BLUE}Find the original repo at $eDEXLink ${NC}\n"


read -n 1 -s -r -p "PRESS ANY BUTTON TO CONTINUE: "
echo " "

echo "Updating ...."
sudo apt update

cat < ~/YoutubeThemeConverter/assets/CoolText/InstallingRequiredSoftware #Printing Text
sudo apt -y install compton plank xfwm4 xfce4-settings nautilus nautilus-extension-gnome-terminal #Installing Required Software

sudo rm -r ~/.YoutubeThemeConverter
mkdir ~/.YoutubeThemeConverter

#Backing up cloned files into .YoutubeThemeConverter folder
cp YoutubeThemeConverter.sh ~/.YoutubeThemeConverter
cp RevertBackToDefaultConfigs.sh ~/.YoutubeThemeConverter
cp -r assets ~/.YoutubeThemeConverter
cp Screenshot.png ~/.YoutubeThemeConverter
cp README.md ~/.YoutubeThemeConverter


if [ -d ~/.themes/Flat-Remix-GTK-Red-Darkest-Solid-NoBorder ]; then  #Checking if the theme has been installed
    cat < ~/YoutubeThemeConverter/assets/CoolText/ThemeAlreadyInstalled
else #Cloning theme if not downloaded
    cat < ~/YoutubeThemeConverter/assets/CoolText/InstallingTheme
    git clone $ThemeLink ~/.YoutubeThemeConverter/flat-remix-gtk
    mkdir ~/.themes
    cp -r ~/.YoutubeThemeConverter/flat-remix-gtk/Flat-Remix-GTK-Red-Darkest-Solid-NoBorder ~/.themes/
fi


if [ -d  /usr/share/icons/Papirus-Dark ]; then #Checking if the icons from github have already been cloned
    echo "The icon theme is already downloaded"
else #Cloning the icons if not downloaded
    cat < ~/YoutubeThemeConverter/assets/CoolText/InstallingIcons
    git clone $IconsLink ~/.YoutubeThemeConverter/papirus-icon-theme

fi

if [ -d  /usr/share/icons/Papirus-Dark ]; then #Checking if the icons have been installed
    cat < ~/YoutubeThemeConverter/assets/CoolText/IconsAlreadyInstalled
else #Installing icons if not installed
    cd ~/.YoutubeThemeConverter/papirus-icon-theme
    sudo chmod +x install.sh
    ./install.sh
    wget -qO- https://git.io/papirus-folders-install | sh
    papirus-folders -C red --theme Papirus-Dark #Changing folder icons colour to red
fi


if [ -d ~/.icons/Bibata-Original-Classic ]; then  #Checking if the cursors are installed
    cat < ~/YoutubeThemeConverter/assets/CoolText/CursorsAlreadyInstalled
else 
    cat < ~/YoutubeThemeConverter/assets/CoolText/InstallingCursors #Printing text
    cd ~/.YoutubeThemeConverter
    wget https://github.com/ful1e5/Bibata_Cursor/releases/download/v1.0.3/Bibata-Original-Classic.tar.gz #Downloading the cusrsors
    tar -xzvf Bibata-Original-Classic.tar.gz #Extracting the cursors
    cp -r Bibata-Original-Classic ~/.icons/ #Copying the cursors to the icons folder

fi


if [ -f ~/.YoutubeThemeConverter/.YoutubeThemeConverter/youtuber-logos-wallpapers-wp7475215?nocache=1 ]; then #Checking if wallpaper is already installed
    cat < ~/YoutubeThemeConverter/assets/CoolText/WallpaperIsAlreadyDownloaded
else 
    cat < ~/YoutubeThemeConverter/assets/CoolText/DownloadingWallpaper
    cd ~/.YoutubeThemeConverter/
    wget $WallpaperLink #Installing Wallpaper
fi

pcmanfm --set-wallpaper="/home/pi/.YoutubeThemeConverter/youtuber-logos-wallpapers-wp7475215?nocache=1" #Changing Wallpaper

#Copying the config files
cp -r ~/.YoutubeThemeConverter/assets/lxpanel ~/.config/ 
cp -r ~/.YoutubeThemeConverter/assets/lxsession ~/.config/
cp -r ~/.YoutubeThemeConverter/assets/lxterminal ~/.config/
cp -r ~/.YoutubeThemeConverter/assets/autostart ~/.config/
cp -r ~/.YoutubeThemeConverter/assets/eDEX-UI ~/.config/

sudo rm /usr/share/plank/themes/Default/dock.theme #Removing Plank Default Theme
sudo cp ~/.YoutubeThemeConverter/assets/mcOS_Catalina\ Black/dock.theme /usr/share/plank/themes/Default/ #Copying Dock Theme

#Copying Some Desktop Shortcuts
sudo cp ~/.YoutubeThemeConverter/assets/DesktopShortcuts/SubToMyYT ~/Desktop/
sudo cp ~/.YoutubeThemeConverter/assets/DesktopShortcuts/JoinMyDiscord ~/Desktop/

#Installing some of my favourite software
git clone https://github.com/Botspot/pi-apps ~/pi-apps #Downloading Pi apps
~/pi-apps/install #Installing PiApps
~/pi-apps/manage install Discord #Installing Discord
~/pi-apps/manage install eDEX-UI #Installing eDex-UI


echo ""
read -n 1 -s -r -p "YOUR SYSTEM WILL REBOOT NOW PRESS ANY BUTTON: "
sudo reboot now

