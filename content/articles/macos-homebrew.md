---
title: Como instalar e configurar o Homebrew no macOS
summary: Aprenda como instalar, configurar e utilizar o Homebrew no macOS para gerenciar pacotes, aplicativos e ferramentas de desenvolvimento pelo terminal.
tags: macOS, Homebrew
date: 2026-05-03
---

O Homebrew é o gerenciador de pacotes mais popular do macOS e se tornou praticamente indispensável para desenvolvedores, administradores de sistemas e usuários avançados.

Com ele, é possível instalar rapidamente:

- Linguagens de programação.
- Ferramentas de linha de comando.
- Aplicativos.
- Utilitários de desenvolvimento.
- Bancos de dados.
- Softwares open source.

Tudo isso diretamente pelo terminal e com poucos comandos.

Neste guia, você vai aprender como instalar e configurar o Homebrew no macOS corretamente.

## O que é o Homebrew?

O Homebrew funciona como um gerenciador de pacotes para macOS, semelhante ao:

- `apt` no Debian e Ubuntu.
- `dnf` no Fedora.
- `pacman` no Arch Linux.

Ele automatiza a instalação, atualização e remoção de softwares através do terminal.

Atualmente, o Homebrew possui milhares de pacotes disponíveis, incluindo ferramentas populares como:

- Git.
- Python.
- Node.js.
- Docker.
- Swift.
- Terraform.
- Kubernetes CLI.
- Neovim.

Além disso, o Homebrew também suporta aplicativos gráficos através do Homebrew Cask.

## Por que instalar o Homebrew?

O Homebrew simplifica bastante o gerenciamento de softwares no macOS.

Entre as principais vantagens estão:

- Instalação rápida de aplicativos.
- Atualizações simplificadas.
- Facilidade para desenvolvimento.
- Gerenciamento centralizado de dependências.
- Grande catálogo de pacotes.
- Excelente integração com o terminal.

Para quem trabalha com desenvolvimento, DevOps ou administração de sistemas, o Homebrew praticamente se torna uma ferramenta obrigatória.

## Como instalar o Homebrew no macOS

A instalação do Homebrew é bastante simples e pode ser feita diretamente pelo Terminal.

## Abrindo o Terminal

O Terminal está disponível em:

```bash
Aplicativos -> Utilitários -> Terminal
````

Também é possível abrir utilizando o Spotlight.

## Executando o instalador oficial

No Terminal, execute o comando oficial abaixo:

```bash
/bin/bash -c \
"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Esse script realiza automaticamente:

- Download do Homebrew.
- Configuração inicial.
- Verificação do sistema.
- Instalação das dependências necessárias.

Durante o processo, o macOS pode solicitar:

- Senha de administrador.
- Instalação das Xcode Command Line Tools.

Essas ferramentas são necessárias para compilação de diversos pacotes.

## Como configurar o PATH do Homebrew

Após a instalação, normalmente será necessário adicionar o Homebrew ao PATH do sistema.

Na maioria dos Macs com Apple Silicon, o Homebrew é instalado em:

```bash
/opt/homebrew
```

O próprio instalador exibirá o comando correto para configurar o ambiente.

Normalmente será algo parecido com:

```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

> É importante utilizar exatamente o comando exibido no seu terminal durante a instalação.

## Como verificar se o Homebrew foi instalado corretamente

Depois da instalação, execute:

```bash
brew doctor
```

Se tudo estiver correto, a saída será semelhante a:

```bash
Your system is ready to brew.
```

Isso significa que o Homebrew está instalado e funcionando corretamente.

## Comandos básicos do Homebrew

Depois de instalado, você já pode começar a utilizar o Homebrew para instalar softwares.

### Instalando pacotes

Para instalar um pacote:

```bash
brew install nome-do-pacote
```

Exemplo:

```bash
brew install git
```

### Atualizando o Homebrew

Para atualizar a lista de pacotes e o próprio Homebrew:

```bash
brew update
```

### Atualizando pacotes instalados

Para atualizar todos os softwares instalados:

```bash
brew upgrade
```

### Removendo aplicativos

Para remover um pacote instalado:

```bash
brew uninstall nome-do-pacote
```

Também é possível utilizar:

```bash
brew remove nome-do-pacote
```

### Removendo dependências não utilizadas

Com o tempo, algumas dependências antigas podem permanecer instaladas no sistema.

Para limpar automaticamente:

```bash
brew autoremove
```

## Instalando aplicativos gráficos com Homebrew

O Homebrew também permite instalar aplicativos gráficos utilizando o Homebrew Cask.

Exemplo:

```bash
brew install --cask visual-studio-code
```

Isso facilita bastante a automação da configuração de novos Macs.

## Vale a pena usar Homebrew no macOS?

Sim. Atualmente, o Homebrew é praticamente o padrão para gerenciamento de pacotes no macOS.

Ele oferece uma experiência muito mais prática para:

- Desenvolvimento.
- Automação.
- Administração de sistemas.
- Gerenciamento de ferramentas.
- Instalação de softwares open source.

Além disso, muitos tutoriais modernos para macOS já assumem que o Homebrew está instalado no sistema.

## Conclusão

O Homebrew é uma das ferramentas mais importantes para usuários avançados e desenvolvedores no macOS. Com ele, instalar e atualizar aplicativos pelo terminal se torna muito mais rápido e organizado.

Depois de configurado, o Homebrew facilita bastante a manutenção do ambiente de desenvolvimento e ajuda a automatizar a instalação de ferramentas essenciais no sistema.
