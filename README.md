# Fedora Dev Setup

Repositório para versionar e restaurar meu ambiente de desenvolvimento no Fedora Linux.

A ideia é simples: manter todas as configurações importantes do sistema sob controle de versão, permitindo recriar rapidamente o ambiente em uma nova instalação.

---

## Objetivos

- Versionar configurações do sistema.
- Facilitar a reinstalação do Fedora.
- Centralizar configurações de desenvolvimento.
- Manter um ambiente reproduzível.

---

## Estrutura

```text
fedoraDev/
├── kde/
│   ├── install.sh
│   └── ...
├── terminal/
│   ├── install.sh
│   ├── bashrc
│   ├── aliases
│   ├── starship.toml
│   ├── HackerDEV.profile
│   └── fastfetch/
├── vscode/
│   ├── install.sh
│   ├── settings.json
│   ├── keybindings.json
│   └── extensions.txt
├── sync.sh
└── install.sh
```

Cada diretório representa um módulo independente.

---

## Como funciona

### Exportar configurações

Salva as configurações atuais do sistema no repositório.

```bash
./sync.sh
```

Depois basta fazer o commit normalmente.

---

### Restaurar configurações

Aplica todas as configurações do repositório no sistema.

```bash
./install.sh
```

Cada módulo é responsável por restaurar suas próprias configurações.

---

## Módulos

### Terminal

- Bash
- Aliases
- Starship
- Fastfetch
- Perfil do Konsole

---

### KDE Plasma

- Painel
- Atalhos
- KWin
- Configurações do Plasma

---

### VS Code

- Settings
- Keybindings
- Lista de extensões

---

## Fluxo de trabalho

```text
Alterei alguma configuração
        │
        ▼
./sync.sh
        │
        ▼
git add .
        │
        ▼
git commit
        │
        ▼
GitHub
```

Nova instalação do Fedora:

```text
Clone
    │
    ▼
./install.sh
    │
    ▼
Ambiente configurado
```

---

## Tecnologias

- Fedora Linux
- Bash
- KDE Plasma
- Konsole
- VS Code
- Git

---

## Licença

MIT
