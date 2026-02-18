#!/bin/bash

# Define the directory
JENV_DIR="$HOME/.jenv"
BASHRC_D_DIR="$HOME/.bashrc.d"
JENV_BASHRC_FILE="$BASHRC_D_DIR/jenv"

# Check if the .jenv directory exists
if [ -d "$JENV_DIR" ]; then
    echo "jenv: .jenv directory exists. Pulling the latest changes..."
    cd "$JENV_DIR" || exit
    git pull
else
    echo "jenv: .jenv directory does not exist. Cloning jenv..."
    git clone https://github.com/jenv/jenv.git "$JENV_DIR"

    # Create .bashrc.d directory if it doesn't exist
    if [ ! -d "$BASHRC_D_DIR" ]; then
        mkdir -p "$BASHRC_D_DIR"
    fi

    # Add jenv configuration to ~/.bashrc.d/jenv
    echo 'export PATH="$HOME/.jenv/bin:$PATH"' > "$JENV_BASHRC_FILE"
    echo 'eval "$(jenv init -)"' >> "$JENV_BASHRC_FILE"
    echo "Created $JENV_BASHRC_FILE with jenv configuration."

    echo "jenv: Sourcing ~/.bashrc to apply jenv changes..."
    source "$HOME/.bashrc"
fi
