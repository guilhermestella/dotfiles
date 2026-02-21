#!/bin/bash

# 1. Define the fonts you want to install
FONTS=("JetBrainsMono" "Hack" "FiraCode" "Meslo")

# 2. Setup paths
# SCRIPT_DIR is where the script is currently located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="$HOME/.local/share/fonts"

echo "fonts: Creating target directory $TARGET_DIR if needed..."
mkdir -p "$TARGET_DIR"

# 3. Loop through the list
for FONT in "${FONTS[@]}"; do
    LOCAL_FONT_PATH="$SCRIPT_DIR/$FONT"
    
    # Check if the font folder exists locally where the script is
    if [ ! -d "$LOCAL_FONT_PATH" ]; then
        echo "fonts: --------------------------------------------"
        echo "fonts: $FONT not found locally. Downloading..."
        
        URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/${FONT}.zip"
        wget -q --show-progress -O "$SCRIPT_DIR/${FONT}.zip" "$URL"
        
        echo "fonts: Extracting $FONT into $LOCAL_FONT_PATH..."
        unzip -q -o "$SCRIPT_DIR/${FONT}.zip" -d "$LOCAL_FONT_PATH"
        rm "$SCRIPT_DIR/${FONT}.zip"
    else
        echo "fonts: $FONT already exists in script directory. Skipping download."
    fi

    # 4. Create the symlink to ~/.local/share/fonts
    echo "fonts: Linking $FONT to $TARGET_DIR..."
    # -s: symbolic, -f: force (overwrite existing link), -n: treat link as a file
    ln -sfn "$LOCAL_FONT_PATH" "$TARGET_DIR/$FONT"
done

# 5. Update system font cache
echo "fonts: Updating system font cache..."
fc-cache -f

echo "fonts: All fonts linked and cache updated!"
