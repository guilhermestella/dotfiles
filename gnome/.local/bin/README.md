# `~/.local/bin` scripts

This directory contains assorted scripts intended to live on `PATH`. Currently
includes:

- `winscale.sh` — resize the focused window with D-Bus

The full content of each script is included below so you can review, copy, or
modify without visiting separate files.

---

## winscale.sh

Resize the focused window to given screen coordinates via GNOME Shell D-Bus.

### Requirements

- [Window Calls](https://github.com/ickyicky/window-calls) GNOME Shell extension
- [Focused Window D-Bus](https://github.com/flexagoon/focused-window-dbus) GNOME Shell extension
- `gdbus` and `jq` binaries (install via your package manager)

### Usage

```sh
winscale.sh [%widht, %height]
```

All four arguments are positional and required together. If omitted, the window
is placed at an "almost maximized" position on a 1920×1080 screen.

#### Examples

```sh
# Almost maximized (default)
winscale.sh 100 100

# Custom size and position
winscale.sh 85 80
```

