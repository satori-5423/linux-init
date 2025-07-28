#!/bin/bash

chsh -s $(which fish)

mkdir -p ~/.config/
mkdir -p ~/.local/

cp -rv ./files/.config/* ~/.config/
cp -rv ./files/.local/* ~/.local/
cp -v ./files/dotfiles/.* ~/

read -p "Install GNOME extensions now? (Y/n): " yes_or_no
if [[ "$yes_or_no" =~ ^[Yy]?$ ]]; then
    ~/.local/bin/update-gnome-extensions
    # Merge
    cp -rv ./files/.local/share/gnome-shell/extensions/* ~/.local/share/gnome-shell/extensions/
fi

# 已备份 ~/.config/nvim
# git clone https://github.com/LazyVim/starter ~/.config/nvim
# rm -rf ~/.config/nvim/.git

if [[ "$(whoami)" != "satori" ]]; then
    sed "s|/home/satori|/home/$(whoami)|g" ./dconf/dconf-gnome.ini > ./dconf/dconf-gnome-patched.ini
    dconf load /org/gnome/ < ./dconf/dconf-gnome-patched.ini
    rm -v ./dconf/dconf-gnome-patched.ini
else
    dconf load /org/gnome/ < ./dconf/dconf-gnome.ini
fi
## sudo -u gdm DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/120/bus dconf load / < ./dconf/dconf-gdm.ini

mkdir -p ~/.config/Cursor/User
mv -v ~/.config/settings.json ~/.config/Cursor/User/settings.json
