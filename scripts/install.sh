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

read -p "CPU: AMD or Intel? (A/i): " amd_or_intel
if [ "$amd_or_intel" = "i" ] || [ "$amd_or_intel" = "I" ]; then
    include_pkgs="$include_pkgs intel-ucode"
else
    include_pkgs="$include_pkgs amd-ucode"
fi

read -p "GPU: AMD or NVIDIA? (A/n): " amd_or_nvidia
if [ "$amd_or_nvidia" = "n" ] || [ "$amd_or_nvidia" = "N" ]; then
    include_pkgs="$include_pkgs $(cat ./pkgs/arch/game/nvidia)"
else
    include_pkgs="$include_pkgs $(cat ./pkgs/arch/game/amd)"
fi

sudo pacman -S --needed $include_pkgs
sudo pacman -Rns $exclude_pkgs

INIT_PATH=$(pwd)
GITHUB_PATH="$HOME/GitHub"
mkdir -p $GITHUB_PATH
if [ -d "$GITHUB_PATH/Orchis-theme" ]; then
    git pull
else
    git clone https://github.com/vinceliuice/Orchis-theme.git "$GITHUB_PATH/Orchis-theme"
fi
cd "$GITHUB_PATH/Orchis-theme"
./install.sh
cd $INIT_PATH

sudo pacman -U $(ls ./files/.cache/*)

paru -Syu --needed $(cat ./pkgs/aur)
