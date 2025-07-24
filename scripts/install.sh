#!/bin/bash

ex_gnome=$(cat ./pkgs/del/gnome)

exclude_pkgs="$ex_gnome"

# exclude_pkgs=$(echo $ex_gnome | tr '\n' ',')

# if [[ "$exclude_pkgs" =~ ,$ ]]; then
#     exclude_pkgs="${exclude_pkgs%?}"
# fi

apps=$(cat ./pkgs/arch/apps)
core=$(cat ./pkgs/arch/core)
fonts=$(cat ./pkgs/arch/fonts)
other=$(cat ./pkgs/arch/other)

group=$(cat ./pkgs/arch/group/*)
game=$(cat ./pkgs/arch/game/wine)

include_pkgs="$apps $core $fonts $other $group $game"

read -p "CPU: AMD or Intel? (a/i): " amd_or_intel
if [ "$amd_or_intel" = "a" ] || [ "$amd_or_intel" = "A" ]; then
    include_pkgs="$include_pkgs amd-ucode"
else
    include_pkgs="$include_pkgs intel-ucode"
fi

read -p "GPU: AMD or NVIDIA? (a/n): " amd_or_nvidia
if [ "$amd_or_nvidia" = "a" ] || [ "$amd_or_nvidia" = "A" ]; then
    include_pkgs="$include_pkgs $(cat ./pkgs/arch/game/amd)"
else
    include_pkgs="$include_pkgs $(cat ./pkgs/arch/game/nvidia)"
fi

sudo pacman -S --needed $include_pkgs
sudo pacman -Rns $exclude_pkgs
sudo pacman -U ~/.cache/paru/clone/paru/paru-2.1.0-1-x86_64.pkg.tar.zst

INIT_PATH=$(pwd)
if [ -d "./Orchis-theme" ]; then
    git pull
else
    git clone https://github.com/vinceliuice/Orchis-theme.git
fi
cd Orchis-theme
./install.sh
cd $INIT_PATH

mkdir -p ~/.cache/
cp -r ./files/.cache/* ~/.cache/

paru -Syu --needed $(cat ./pkgs/aur)
