#!/bin/bash

# Install
if ! command -v nvim >/dev/null 2>&1; then
    echo "vim: Neovim not found. Installing..."
    sudo dnf install -y neovim
fi

# Create ~/.bashrc.d if it doesn't exist
mkdir -p "$HOME/.bashrc.d"

# Write alias file
cat > "$HOME/.bashrc.d/nvim" <<EOF
alias vim=nvim
export EDITOR=nvim
export VISUAL=nvim
export GIT_EDITOR=nvim
EOF

# Link Neovim config
ln -sfn "$HOME/dotfiles/vim/nvim" "$HOME/.config/nvim"

echo "vim: Neovim configured"
