#!/bin/bash

# Define paths
BASHRC_D_DIR="$HOME/.bashrc.d"
TERMINAL_FILE="$BASHRC_D_DIR/terminal"

# Create ~/.bashrc.d if it doesn't exist
if [ ! -d "$BASHRC_D_DIR" ]; then
    mkdir -p "$BASHRC_D_DIR"
    echo "terminal: Created $BASHRC_D_DIR directory."
fi

# Create ~/.bashrc.d/terminal if it doesn't exist
if [ ! -f "$TERMINAL_FILE" ]; then
    echo "terminal: Creating $TERMINAL_FILE with custom PS1 configuration..."
    cat > "$TERMINAL_FILE" << 'EOF'
# Show git branch name
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
}
PS1='\[\033[01;34m\]\w\[\033[00;32m\] $(parse_git_branch)\[\033[00m\]\$ '
PS1=${PS1%?}
PS1=${PS1%?}\n'$ '
EOF
    echo "terminal: Added PS1 configuration to $TERMINAL_FILE."
    echo "terminal: Sourcing ~/.bashrc to apply terminal changes..."
    source "$HOME/.bashrc"
else
    echo "terminal: $TERMINAL_FILE already exists. No changes made."
fi
