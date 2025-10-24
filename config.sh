#!/usr/bin/env bash
set -e

DOTFILES_DIR="$HOME/.dotfiles"

if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Error: $DOTFILES_DIR does not exist"
    exit 1
fi

echo "Setting up dotfiles from $DOTFILES_DIR"

link_dotfile() {
    local src="$1"
    local dest="$2"

    if [ -L "$dest" ] && [ "$(readlink "$dest")" == "$src" ]; then
        echo "$dest already correctly linked"
        return
    fi

    if [ -e "$dest" ] || [ -L "$dest" ]; then
        local backup="${dest}_ancient"
        echo "Backing up $dest to $backup"
        mv "$dest" "$backup"
    fi

    ln -s "$src" "$dest"
    echo "$(basename "$dest") configured"
}

APPS=("kitty" "nvim" "bash" "git")

if [ "$#" -gt 0 ]; then
    APPS=("$@")
fi

for app in "${APPS[@]}"; do
    case "$app" in
        kitty)
            mkdir -p "$HOME/.config"
            link_dotfile "$DOTFILES_DIR/kitty" "$HOME/.config/kitty"
            ;;
        nvim)
            mkdir -p "$HOME/.config"
            link_dotfile "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
            ;;
        bash)
            link_dotfile "$DOTFILES_DIR/bash/.bashrc" "$HOME/.bashrc"
            link_dotfile "$DOTFILES_DIR/bash/.bash_aliases" "$HOME/.bash_aliases"
            ;;
        git)
            link_dotfile "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"
            ;;
        *)
            echo "Warning: unknown app '$app', skipping."
            ;;
    esac
done

echo "All requested dotfiles configured successfully!"
