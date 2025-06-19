#!/bin/bash

chsh -s $(which fish)

mkdir -p ~/.config/
mkdir -p ~/.local/

cp -r ./files/.config/* ~/.config/
cp -r ./files/.local/* ~/.local/
cp ./files/.nanorc ~/.nanorc

chmod +x ~/.local/bin/*
~/.local/bin/update-gnome-extensions

# 已备份 ~/.config/nvim
# git clone https://github.com/LazyVim/starter ~/.config/nvim
# rm -rf ~/.config/nvim/.git

dconf load /org/gnome/ < ./dconf/dconf-gnome.ini
sudo -u gdm DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/120/bus dconf load / < ./dconf/dconf-gdm.ini

mkdir -p ~/.config/Cursor/User
mv ~/.config/settings.json ~/.config/Cursor/User/settings.json
