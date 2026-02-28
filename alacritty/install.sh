#!/bin/bash

# Variables
PACKAGE="alacritty"
# Explicit path to your dotfiles
DOTFILES_DIR="$HOME/dotfiles/alacritty"
CONFIG_DIR="$HOME/.config/alacritty"

# Source files
THEME_SOURCE="$DOTFILES_DIR/gruvbox-dark.toml"
CONFIG_SOURCE="$DOTFILES_DIR/alacritty.toml"

# Destination links
THEME_LINK="$CONFIG_DIR/gruvbox-dark.toml"
CONFIG_LINK="$CONFIG_DIR/alacritty.toml"

echo "alacritty: Step 1: Checking if $PACKAGE is installed..."

if command -v $PACKAGE &> /dev/null; then
    echo "alacritty: Done: $PACKAGE is already installed."
else
    echo "alacritty: $PACKAGE not found. Installing via dnf..."
    sudo dnf install -y $PACKAGE
    if [ $? -ne 0 ]; then
        echo "alacritty: Error: Install failed."
        exit 1
    fi
fi

echo "alacritty: Step 2: Ensuring config directory exists..."
mkdir -p "$CONFIG_DIR"

echo "alacritty: Step 3: Linking Catppuccin theme file..."
if [ -f "$THEME_SOURCE" ]; then
    rm -f "$THEME_LINK"
    ln -s "$THEME_SOURCE" "$THEME_LINK"
    echo "alacritty: Success: Theme link created: $THEME_LINK"
else
    echo "alacritty: Error: Source '$THEME_SOURCE' not found."
    exit 1
fi

echo "alacritty: Step 4: Linking alacritty.toml..."
if [ -f "$CONFIG_SOURCE" ]; then
    rm -f "$CONFIG_LINK"
    ln -s "$CONFIG_SOURCE" "$CONFIG_LINK"
    echo "alacritty: Success: Config link created: $CONFIG_LINK"
else
    echo "alacritty: Error: Source '$CONFIG_SOURCE' not found."
    exit 1
fi

echo "alacritty: --- All tasks completed successfully! ---"
