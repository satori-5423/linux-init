#!/bin/bash

chsh -s $(which fish)

mkdir -p ~/.config/
mkdir -p ~/.local/
mkdir -p ~/.themes/

cp -r ./files/.config/* ~/.config/
cp -r ./files/.local/* ~/.local/
cp -r ./files/.themes/* ~/.themes/
cp ./files/dotfiles/.* ~/

chmod -R +x ~/.local/bin/

# Merge
cp -r ./files/.local/share/gnome-shell/extensions/* ~/.local/share/gnome-shell/extensions/

# 已备份 ~/.config/nvim
# git clone https://github.com/LazyVim/starter ~/.config/nvim
# rm -rf ~/.config/nvim/.git

dconf load /org/gnome/ < ./dconf/dconf-gnome.ini
sudo -u gdm DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/120/bus dconf load / < ./dconf/dconf-gdm.ini

mkdir -p ~/.config/Cursor/User
mv ~/.config/settings.json ~/.config/Cursor/User/settings.json
