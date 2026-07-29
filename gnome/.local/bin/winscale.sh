#!/bin/bash

# Usage: resize-window.sh [x y width height]
# Defaults to "almost maximized" on a 1920x1080 screen if no args given.
X=${1:-20}
Y=${2:-52}
WIDTH=${3:-1880}
HEIGHT=${4:-1000}

if [ "$#" -ne 0 ] && [ "$#" -ne 4 ]; then
  echo "Usage: $0 [x y width height]" >&2
  exit 1
fi

# Get wm_class of the currently focused window
FOCUSED_RAW=$(gdbus call --session --dest org.gnome.Shell \
  --object-path /org/gnome/shell/extensions/FocusedWindow \
  --method org.gnome.shell.extensions.FocusedWindow.Get)

FOCUSED_JSON=$(echo "$FOCUSED_RAW" | sed -e "s/^('//" -e "s/',)$//")
WM_CLASS=$(echo "$FOCUSED_JSON" | jq -r '.wm_class')

# Find that window's id from the full window list
LIST_RAW=$(gdbus call --session --dest org.gnome.Shell \
  --object-path /org/gnome/Shell/Extensions/Windows \
  --method org.gnome.Shell.Extensions.Windows.List)

LIST_JSON=$(echo "$LIST_RAW" | sed -e "s/^('//" -e "s/',)$//")
WIN_ID=$(echo "$LIST_JSON" | jq -r --arg wc "$WM_CLASS" \
  '[.[] | select(.wm_class == $wc and .in_current_workspace == true)][0].id')

if [ -z "$WIN_ID" ] || [ "$WIN_ID" == "null" ]; then
  echo "Could not find focused window id" >&2
  exit 1
fi

gdbus call --session --dest org.gnome.Shell \
  --object-path /org/gnome/Shell/Extensions/Windows \
  --method org.gnome.Shell.Extensions.Windows.MoveResize \
  "$WIN_ID" "$X" "$Y" "$WIDTH" "$HEIGHT"
