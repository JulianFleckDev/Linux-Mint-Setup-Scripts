#!/usr/bin/env bash

sudo apt update; sudo apt upgrade -y

sudo apt install ufw -y
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable
sudo ufw status verbose

cd /home/"$USER"/Downloads
wget https://github.com/luisrguerra/fluent11-icon-theme/archive/refs/tags/0.6.zip
wget https://github.com/vinceliuice/Fluent-gtk-theme/archive/refs/tags/2025-04-17.zip

unzip 0.6.zip
unzip 2025-04-17.zip

sudo rm -rf 0.6.zip
sudo rm -rf 2025-04-17.zip

sudo chown -R "$SUDO_USER":sudo Fluent-gtk-theme-2025-04-17
sudo chown -R "$SUDO_USER":sudo fluent11-icon-theme-0.6

bash Fluent-gtk-theme-2025-04-17/install.sh

mkdir -p /home/"$USER"/.icons
cp -r fluent11-icon-theme-0.6/fluent11 /home/"$USER"/.icons
cp -r fluent11-icon-theme-0.6/fluent11-light /home/"$USER"/.icons
cd ..

cd /home/"$USER"/.icons
sudo chown -R "$SUDO_USER":sudo fluent11
sudo chown -R "$SUDO_USER":sudo fluent11-light

gsettings set org.cinnamon.desktop.interface cursor-theme "DMZ-White"
gsettings get org.cinnamon.desktop.interface cursor-theme

gsettings set org.cinnamon.desktop.interface gtk-theme "Fluent-Light"
gsettings set org.cinnamon.theme name "Fluent-Dark"
gsettings set org.cinnamon.desktop.interface icon-theme "fluent11"

#Font
cd /home/"$USER"/Downloads
wget https://github.com/rsms/inter/releases/download/v4.1/Inter-4.1.zip

mkdir -p /home/"$USER"/Downloads/Inter-4.1
unzip Inter-4.1.zip -d Inter-4.1

sudo rm -rf Inter-4.1.zip

sudo chown -R "$SUDO_USER":sudo Inter-4.1

mkdir -p /home/"$USER"/.local/share/fonts
cp -r Inter-4.1/Inter.ttc /home/"$USER"/.local/share/fonts
cp -r Inter-4.1/InterVariable.ttf /home/"$USER"/.local/share/fonts
cp -r Inter-4.1/InterVariable-Italic.ttf /home/"$USER"/.local/share/fonts
cd ..

cd /home/"$USER"/.local/share/fonts
sudo chown -R "$SUDO_USER":sudo Inter.ttc
sudo chown -R "$SUDO_USER":sudo InterVariable.ttf
sudo chown -R "$SUDO_USER":sudo InterVariable-Italic.ttf
cd ..

gsettings set org.cinnamon.desktop.interface font-name "Inter Display Regular 12"
gsettings set org.gnome.desktop.interface document-font-name "Inter Display Regular 11"
gsettings set org.nemo.desktop font "Inter Display Medium 12"
gsettings set org.cinnamon.desktop.wm.preferences titlebar-font "Inter Display Bold 13"

neofetch
