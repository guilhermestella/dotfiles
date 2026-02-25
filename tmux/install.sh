#!/bin/bash

# Link file
ln -sf "$HOME/dotfiles/tmux/tmux.conf" "$HOME/.tmux.conf"

# Install TPM
TPM_DIR="$HOME/.tmux/plugins/tpm"

if [ -d "$TPM_DIR" ]; then
    echo "tmux: TPM already installed. Updating..."
    cd "$TPM_DIR" && git pull
    echo "tmux: TPM updated"
else
    echo "tmux: TPM not found. Installing..."
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
    echo "tmux: TPM installed!"
fi


