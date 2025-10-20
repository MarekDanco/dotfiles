#!/usr/bin/env bash
set -e

echo "setting up dotfiles"

backup_and_remove() {
    local target="$1"
    if [ -e "$target" ] || [ -L "$target" ]; then
        local backup="${target}_ancient"
        echo "backing up $target to $backup"
        mv "$target" "$backup"
    fi
}

# kitty
backup_and_remove "$HOME/.config/kitty"
mkdir -p "$HOME/.config"
ln -s "$HOME/dotfiles/kitty" "$HOME/.config/kitty"
echo "kitty configured"

# nvim
backup_and_remove "$HOME/.config/nvim"
mkdir -p "$HOME/.config"
ln -s "$HOME/dotfiles/nvim" "$HOME/.config/nvim"
echo "nvim configured"

# bash
backup_and_remove "$HOME/.bashrc"
backup_and_remove "$HOME/.bash_aliases"
ln -s "$HOME/dotfiles/bash/.bashrc" "$HOME/.bashrc"
ln -s "$HOME/dotfiles/bash/.bash_aliases" "$HOME/.bash_aliases"
echo "bash configured"

# git
backup_and_remove "$HOME/.gitconfig"
ln -s "$HOME/dotfiles/git/.gitconfig" "$HOME/.gitconfig"
echo "git configured"

echo "all dotfiles set up successfully!"
