#!/bin/bash
set -euo pipefail

# Usage: winscale.sh [width_percent] [height_percent]
# Sizes the focused window to a percentage of the current screen (default: 90x90), centered.
# Examples: winscale.sh        -> 90% width, 90% height
#           winscale.sh 80     -> 80% width, 90% height
#           winscale.sh 80 60  -> 80% width, 60% height
W_PERCENT=${1:-90}
H_PERCENT=${2:-90}

if [ "$#" -gt 2 ]; then
  echo "Usage: $0 [width_percent] [height_percent]" >&2
  exit 1
fi

clamp() { if [ "$1" -lt 1 ]; then echo 1; elif [ "$1" -gt 100 ]; then echo 100; else echo "$1"; fi; }
W_PERCENT=$(clamp "$W_PERCENT")
H_PERCENT=$(clamp "$H_PERCENT")

# Current screen resolution
read -r SWIDTH SHEIGHT < <(xdpyinfo | awk '/dimensions:/{split($2,a,"x"); print a[1], a[2]}')

# Compute centered window size
WIDTH=$((SWIDTH * W_PERCENT / 100))
HEIGHT=$((SHEIGHT * H_PERCENT / 100))
X=$(((SWIDTH - WIDTH) / 2))
Y=$(((SHEIGHT - HEIGHT) / 2))

# Get id of the currently focused window
FOCUSED_RAW=$(gdbus call --session --dest org.gnome.Shell \
  --object-path /org/gnome/shell/extensions/FocusedWindow \
  --method org.gnome.shell.extensions.FocusedWindow.Get)

WIN_ID=$(echo "$FOCUSED_RAW" | sed -e "s/^('//" -e "s/',)$//" | jq -r '.id')

if [ -z "$WIN_ID" ] || [ "$WIN_ID" = "null" ]; then
  echo "Could not find focused window id" >&2
  exit 1
fi

gdbus call --session --dest org.gnome.Shell \
  --object-path /org/gnome/Shell/Extensions/Windows \
  --method org.gnome.Shell.Extensions.Windows.MoveResize \
  "$WIN_ID" "$X" "$Y" "$WIDTH" "$HEIGHT"
