#!/usr/bin/env bash
set -e

echo "Setting up dotfiles"

# Helper function to remove a file or symlink if it exists
remove() {
    local target="$1"
    if [ -e "$target" ] || [ -L "$target" ]; then
        echo "Removing existing $target"
        rm -rf "$target"
    fi
}

# Vim
remove "$HOME/.vimrc"
remove "$HOME/.vim"
ln -s "$HOME/dotfiles/vim/.vimrc" "$HOME/.vimrc"
ln -s "$HOME/dotfiles/vim/.vim" "$HOME/.vim"
echo "Vim configured."

# Kitty
remove "$HOME/.config/kitty"
mkdir -p "$HOME/.config"
ln -s "$HOME/dotfiles/kitty" "$HOME/.config/kitty"
echo "Kitty configured."

# Bash
remove "$HOME/.bashrc"
remove "$HOME/.bash_aliases"
ln -s "$HOME/dotfiles/bash/.bashrc" "$HOME/.bashrc"
ln -s "$HOME/dotfiles/bash/.bash_aliases" "$HOME/.bash_aliases"
echo "Bash configured."

echo "All dotfiles set up successfully!"
