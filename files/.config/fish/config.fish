if status is-interactive
    # Commands to run in interactive sessions can go here
    set -x PATH "$HOME/.local/bin:$PATH"
    alias icat "kitty +kitten icat"
end

function tray
    if contains appindicatorsupport@rgcjonas.gmail.com (gnome-extensions list --enabled)
        gnome-extensions disable appindicatorsupport@rgcjonas.gmail.com
    else
        gnome-extensions enable appindicatorsupport@rgcjonas.gmail.com
    end
end

# pnpm
set -gx PNPM_HOME "/home/satori/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
