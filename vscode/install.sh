#!/usr/bin/env bash

set -e

echo "==> Instalando VS Code..."

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

sudo tee /etc/yum.repos.d/vscode.repo >/dev/null <<EOF
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF

sudo dnf install -y code

echo "==> Configurando Starship..."

if command -v starship >/dev/null 2>&1; then
    if ! grep -q 'starship init bash' "$HOME/.bashrc"; then
        echo 'eval "$(starship init bash)"' >> "$HOME/.bashrc"
        echo "✔ Starship adicionado ao ~/.bashrc"
    else
        echo "✔ Starship já configurado"
    fi
else
    echo "⚠ Starship não encontrado. Instale o módulo terminal primeiro."
fi

echo "✔ VS Code instalado."
