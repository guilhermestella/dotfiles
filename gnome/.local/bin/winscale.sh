#!/bin/bash

# Usage: winscale.sh [width_percent] [height_percent]
# Sizes the window to a percentage of the current screen (default: 90x90), centered.
# Examples: winscale.sh        -> 90% width, 90% height
#           winscale.sh 80     -> 80% width, 90% height
#           winscale.sh 80 60  -> 80% width, 60% height
W_PERCENT=${1:-90}
H_PERCENT=${2:-90}

if [ "$#" -gt 2 ]; then
  echo "Usage: $0 [width_percent] [height_percent]" >&2
  exit 1
fi

# Get current screen resolution
read -r SWIDTH SHEIGHT < <(xdpyinfo | awk '/dimensions:/{split($2,a,"x"); print a[1], a[2]}')

# Compute centered window size
WIDTH=$((SWIDTH * W_PERCENT / 100))
HEIGHT=$((SHEIGHT * H_PERCENT / 100))
X=$(((SWIDTH - WIDTH) / 2))
Y=$(((SHEIGHT - HEIGHT) / 2))

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
