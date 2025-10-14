#!/usr/bin/env bash
set -e

echo "Setting up dotfiles"

# Helper function: backup a file/folder if it exists
backup_and_remove() {
    local target="$1"
    if [ -e "$target" ] || [ -L "$target" ]; then
        local backup="${target}.bak_$(date +%Y%m%d%H%M%S)"
        echo "Backing up $target to $backup"
        mv "$target" "$backup"
    fi
}

# Vim
backup_and_remove "$HOME/.vimrc"
backup_and_remove "$HOME/.vim"
ln -s "$HOME/dotfiles/vim/.vimrc" "$HOME/.vimrc"
ln -s "$HOME/dotfiles/vim/.vim" "$HOME/.vim"
echo "Vim configured."

# Kitty
backup_and_remove "$HOME/.config/kitty"
mkdir -p "$HOME/.config"
ln -s "$HOME/dotfiles/kitty" "$HOME/.config/kitty"
echo "Kitty configured."

# Bash
backup_and_remove "$HOME/.bashrc"
backup_and_remove "$HOME/.bash_aliases"
ln -s "$HOME/dotfiles/bash/.bashrc" "$HOME/.bashrc"
ln -s "$HOME/dotfiles/bash/.bash_aliases" "$HOME/.bash_aliases"
echo "Bash configured."

# Git
backup_and_remove "$HOME/.gitconfig"
ln -s "$HOME/dotfiles/git/.gitconfig" "$HOME/.gitconfig"
echo "Git configured."

echo "All dotfiles set up successfully!"
