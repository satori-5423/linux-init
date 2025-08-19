#!/usr/bin/env bash

include_pkgs=$(cat ./pkgs/arch/{apps,core,fonts,other,group/*,game/wine})

vendor=$(grep -m1 'vendor_id' /proc/cpuinfo | awk '{print $3}')
case "$vendor" in
    GenuineIntel)
        include_pkgs+=" intel-ucode"
        ;;
    AuthenticAMD)
        include_pkgs+=" amd-ucode"
        ;;
    *)
        echo "Warning: Unknown CPU vendor: $vendor"
        ;;
esac

gpu_vendor=$(lspci | grep -E "VGA|3D" | grep -oE 'AMD|NVIDIA' | head -n1)
case "$gpu_vendor" in
    NVIDIA)
        include_pkgs+=" $(< ./pkgs/arch/game/nvidia)"
        ;;
    AMD)
        include_pkgs+=" $(< ./pkgs/arch/game/amd)"
        ;;
    *)
        echo "Warning: Unknown or unsupported GPU vendor: $gpu_vendor"
        ;;
esac

sudo pacman -S --needed --noconfirm $include_pkgs

INIT_PATH=$(pwd)
GITHUB_PATH="$HOME/GitHub"
mkdir -p $GITHUB_PATH
if [[ -d "$GITHUB_PATH/Orchis-theme" ]]; then
    cd "$GITHUB_PATH/Orchis-theme"
    git pull
else
    git clone https://github.com/vinceliuice/Orchis-theme.git "$GITHUB_PATH/Orchis-theme"
fi
cd "$GITHUB_PATH/Orchis-theme"
./install.sh
cd $INIT_PATH
cat ./themes/gnome-shell/gnome-shell.css >> ~/.themes/Orchis/gnome-shell/gnome-shell.css

sudo pacman -U --needed --noconfirm $(ls ./files/.cache/*)

paru -Syu --needed --noconfirm $(< ./pkgs/aur)
