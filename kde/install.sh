#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Configurando KDE..."

mkdir -p "$HOME/.config"

cp "$SCRIPT_DIR/plasma-org.kde.plasma.desktop-appletsrc" "$HOME/.config/"

for file in plasmarc kwinrc kglobalshortcutsrc kcminputrc; do
    [ -f "$SCRIPT_DIR/$file" ] && cp "$SCRIPT_DIR/$file" "$HOME/.config/"
done

kquitapp6 plasmashell 2>/dev/null || true
kstart6 plasmashell >/dev/null 2>&1 || plasmashell --replace >/dev/null 2>&1 &

echo "✓ Configurações do KDE aplicadas."
