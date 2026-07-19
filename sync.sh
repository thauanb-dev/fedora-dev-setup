#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

TERMINAL_DIR="$SCRIPT_DIR/terminal"
KDE_DIR="$SCRIPT_DIR/kde"
VSCODE_DIR="$SCRIPT_DIR/vscode"

echo "☠ Sincronizando configurações..."

###############################################################################
# TERMINAL
###############################################################################

echo "• Terminal"

mkdir -p "$TERMINAL_DIR"
mkdir -p "$TERMINAL_DIR/fastfetch"

cp "$HOME/.local/share/konsole/HackerDEV.profile" \
   "$TERMINAL_DIR/HackerDEV.profile"

cp "$HOME/.bashrc" \
   "$TERMINAL_DIR/bashrc"

cp "$HOME/.aliases" \
   "$TERMINAL_DIR/aliases"

cp "$HOME/.config/starship.toml" \
   "$TERMINAL_DIR/starship.toml"

cp "$HOME/.config/fastfetch/config.jsonc" \
   "$TERMINAL_DIR/fastfetch/config.jsonc"

###############################################################################
# KDE
###############################################################################

echo "• KDE"

mkdir -p "$KDE_DIR"

for file in \
    plasma-org.kde.plasma.desktop-appletsrc \
    plasmarc \
    kwinrc \
    kglobalshortcutsrc \
    kcminputrc
do
    if [ -f "$HOME/.config/$file" ]; then
        cp "$HOME/.config/$file" "$KDE_DIR/"
        echo "  ✓ $file"
    fi
done

###############################################################################
# VSCODE
###############################################################################

echo "• VS Code"

mkdir -p "$VSCODE_DIR"

cp "$HOME/.config/Code/User/settings.json" \
   "$VSCODE_DIR/settings.json" 2>/dev/null || true

cp "$HOME/.config/Code/User/keybindings.json" \
   "$VSCODE_DIR/keybindings.json" 2>/dev/null || true

code --list-extensions > "$VSCODE_DIR/extensions.txt" 2>/dev/null || true

echo
echo "✅ Sincronização concluída."
