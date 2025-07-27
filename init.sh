#!/bin/bash

echo "Initializing..."

sudo cp ./scripts/locale.conf /etc/locale.conf
sudo cp ./scripts/mirrorlist /etc/pacman.d/mirrorlist
sudo cp ./scripts/pacman.conf /etc/pacman.conf
sudo pacman -Syyu

./scripts/install.sh
./scripts/config.sh

cp ./pictures/icon.jpg ~/.face
sudo cp ./pictures/icon.jpg "/var/lib/AccountsService/icons/$(whoami)"
sudo cp ./pictures/archlinux-logo-text.png /usr/share/pixmaps/archlinux-logo-text.png
sudo systemctl enable gdm

INIT_PATH=$(pwd)
tar -xzvf ./scripts/Inoue-Takina.tar.gz --directory "$INIT_PATH"
cd "$INIT_PATH/Inoue Takina/"
chmod +x ./install.sh
sudo ./install.sh
cd "$INIT_PATH"
rm -rf "./Inoue Takina/"

echo "Done"
echo "Please restart your computer"
