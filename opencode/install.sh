#!/bin/bash

set -e

OPENCODE_CONFIG_DIR="${HOME}/.config/opencode"
OPENCODE_CONFIG_FILE="${OPENCODE_CONFIG_DIR}/opencode.json"
DOTFILES_OPENCODE="${HOME}/dotfiles/opencode/opencode.json"

if ! command -v opencode &> /dev/null; then
    echo "opencode: Installing opencode..."
    npm install -g @opencode/cli
fi

echo "opencode: Configuring opencode..."
mkdir -p "${OPENCODE_CONFIG_DIR}"
ln -sf "${DOTFILES_OPENCODE}" "${OPENCODE_CONFIG_FILE}"

echo "opencode: Done! opencode is installed and configured with gruvbox theme."
