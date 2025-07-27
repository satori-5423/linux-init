#!/bin/bash

ex_gnome=$(< ./pkgs/del/gnome)

exclude_pkgs="$ex_gnome"

# exclude_pkgs=$(echo $ex_gnome | tr '\n' ',')

# if [[ "$exclude_pkgs" =~ ,$ ]]; then
#     exclude_pkgs="${exclude_pkgs%?}"
# fi

apps=$(< ./pkgs/arch/apps)
core=$(< ./pkgs/arch/core)
fonts=$(< ./pkgs/arch/fonts)
other=$(< ./pkgs/arch/other)

group=$(< ./pkgs/arch/group/*)
game=$(< ./pkgs/arch/game/wine)

include_pkgs="$apps $core $fonts $other $group $game"

read -p "CPU: AMD or Intel? (A/i): " amd_or_intel
case "$amd_or_intel" in
  [iI])
    include_pkgs+=" intel-ucode"
    ;;
  *)
    include_pkgs+=" amd-ucode"
    ;;
esac

read -p "GPU: AMD or NVIDIA? (A/n): " amd_or_nvidia
case "$amd_or_nvidia" in
  [nN])
    include_pkgs+=" $(< ./pkgs/arch/game/nvidia)"
    ;;
  *)
    include_pkgs+=" $(< ./pkgs/arch/game/amd)"
    ;;
esac

sudo pacman -S --needed $include_pkgs
sudo pacman -Rns $exclude_pkgs

INIT_PATH=$(pwd)
GITHUB_PATH="$HOME/GitHub"
mkdir -p $GITHUB_PATH
if [[ -d "$GITHUB_PATH/Orchis-theme" ]]; then
    git pull
else
    git clone https://github.com/vinceliuice/Orchis-theme.git "$GITHUB_PATH/Orchis-theme"
fi
cd "$GITHUB_PATH/Orchis-theme"
./install.sh
cd $INIT_PATH
cat ./themes/gnome-shell/gnome-shell.css >> ~/.themes/Orchis/gnome-shell/gnome-shell.css

sudo pacman -U $(ls ./files/.cache/*)

paru -Syu --needed $(< ./pkgs/aur)
