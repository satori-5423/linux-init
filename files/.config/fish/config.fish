if status is-interactive
    # Commands to run in interactive sessions can go here
    set -x PATH "$HOME/.local/bin:$PATH"
    alias icat "kitty +kitten icat"
end

function tray
    trayer --edge top --widthtype request --transparent true --alpha 0
    # About Gtk-WARNING
    # sudo pacman -S gtk-engine-murrine gnome-themes-extra
end

# pnpm
set -gx PNPM_HOME "/home/satori/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
