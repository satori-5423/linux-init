#!/bin/bash

echo "Initializing..."

sudo rm -rf /etc/pacman.d/mirrorlist
sudo rm -rf /etc/pacman.conf
sudo cp ./scripts/mirrorlist /etc/pacman.d/mirrorlist
sudo cp ./scripts/pacman.conf /etc/pacman.conf
sudo pacman -Syyu

chmod +x ./scripts/install.sh
chmod +x ./scripts/config.sh

./scripts/install.sh
./scripts/config.sh

tar -xzvf ./scripts/Inoue-Takina.tar.gz --directory ./
cd ./Inoue\ Takina/
chmod +x ./install.sh
sudo ./install.sh
rm -rf ./Inoue\ Takina/

echo "Done"
echo "Please restart your computer"
