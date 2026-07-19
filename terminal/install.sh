#!/usr/bin/env bash

set -e

#######################################
# Diretório do projeto
#######################################

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

#######################################
# Funções
#######################################

section() {
    echo
    echo "$1"
    echo "────────────────────────────────────────────"
}

#######################################
# Interface
#######################################

clear

echo
echo "╔════════════════════════════════════════════╗"
echo "║          ☠ Fedora Terminal Setup          ║"
echo "╚════════════════════════════════════════════╝"

#######################################
# Verificação
#######################################

section "🔍 Verificando arquivos..."

for arquivo in \
    bashrc \
    aliases \
    starship.toml \
    HackerDEV.profile \
    fastfetch/config.jsonc
do
    [[ -f "$SCRIPT_DIR/$arquivo" ]] || {
        echo "❌ Arquivo '$arquivo' não encontrado."
        exit 1
    }
done

echo "✔ Arquivos encontrados."

#######################################
# Atualização
#######################################

section "🔄 Atualizando sistema..."

sudo dnf upgrade -y

echo "✔ Sistema atualizado."

#######################################
# Dependências
#######################################

section "📦 Instalando utilitários..."

sudo dnf install -y \
    curl \
    wget \
    vim \
    nano \
    tree \
    zip \
    unzip \
    wl-clipboard \
    eza \
    bat \
    btop \
    fastfetch \
    zoxide \
    fzf \
    ripgrep \
    fd-find \
    jq \
    yq \
    ncdu \
    tldr

echo "✔ Utilitários instalados."

#######################################
# Diretórios
#######################################

section "📁 Preparando diretórios..."

mkdir -p \
    "$HOME/.config" \
    "$HOME/.config/fastfetch" \
    "$HOME/.local/share/konsole" \
    "$HOME/bin"

echo "✔ Diretórios preparados."

#######################################
# Starship
#######################################

section "⭐ Instalando Starship..."

if ! command -v starship >/dev/null 2>&1; then
    curl -fsSL https://starship.rs/install.sh | sh -s -- -y
    echo "✔ Starship instalado."
else
    echo "✔ Starship já instalado."
fi

#######################################
# Configurações
#######################################

section "⚙️ Aplicando configurações..."

install -m 644 "$SCRIPT_DIR/bashrc" \
    "$HOME/.bashrc"
echo "  ✓ ~/.bashrc"

install -m 644 "$SCRIPT_DIR/aliases" \
    "$HOME/.aliases"
echo "  ✓ ~/.aliases"

install -m 644 "$SCRIPT_DIR/starship.toml" \
    "$HOME/.config/starship.toml"
echo "  ✓ Starship"

install -m 644 "$SCRIPT_DIR/fastfetch/config.jsonc" \
    "$HOME/.config/fastfetch/config.jsonc"
echo "  ✓ Fastfetch"

install -m 644 "$SCRIPT_DIR/HackerDEV.profile" \
    "$HOME/.local/share/konsole/HackerDEV.profile"
echo "  ✓ HackerDEV.profile"

if command -v kwriteconfig6 >/dev/null 2>&1; then
    kwriteconfig6 \
        --file konsolerc \
        --group "Desktop Entry" \
        --key DefaultProfile \
        HackerDEV.profile

    echo "  ✓ Perfil padrão do Konsole"
fi

echo
echo "✔ Configurações aplicadas."

#######################################
# Finalização
#######################################

echo
echo "══════════════════════════════════════════════"
echo "          ☠ Ambiente configurado!"
echo "══════════════════════════════════════════════"
echo
echo "Abra uma nova janela do Konsole."
echo
echo "Execute:"
echo "  source ~/.bashrc"
echo
echo "✅ Terminal configurado com sucesso."