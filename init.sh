#!/bin/bash

echo "Initializing..."

sudo cp -v ./scripts/locale.conf /etc/locale.conf
sudo cp -v ./scripts/mirrorlist /etc/pacman.d/mirrorlist
sudo cp -v ./scripts/pacman.conf /etc/pacman.conf
sudo pacman -Syyu --noconfirm

./scripts/install.sh
./scripts/config.sh

# Fix bug with Kitty `hide_window_decorations yes` in Wayland session
# -- Just disable Rounded Window Corners extension
# mkdir -p ~/.config/environment.d/
# echo "KITTY_DISABLE_WAYLAND=1" >> ~/.config/environment.d/kitty.conf

# cp -v ./pictures/icon.jpg ~/.face
# sudo cp -v ./pictures/icon.jpg "/var/lib/AccountsService/icons/$(whoami)"
sudo cp -v ./pictures/archlinux-logo-text.png /usr/share/pixmaps/archlinux-logo-text.png
sudo systemctl enable gdm

sudo snapper -c root create-config /

INIT_PATH=$(pwd)
tar -xzvf ./scripts/Inoue-Takina.tar.gz --directory "$INIT_PATH"
cd "$INIT_PATH/Inoue Takina/"
chmod +x ./install.sh
sudo ./install.sh
cd "$INIT_PATH"
rm -rfv "./Inoue Takina/"

echo "Done"
echo "Please restart your computer"
