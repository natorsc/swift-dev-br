---
title: Como instalar a linguagem Swift no Linux com o Swiftly
summary: Aprenda como instalar e gerenciar múltiplas versões da linguagem Swift no Linux utilizando o Swiftly.
tags: Swift, Swiftly, Linux
date: 2026-05-01
---

Gerenciar múltiplas versões de linguagens de programação se tornou algo comum no dia a dia de desenvolvimento. Ferramentas como `rustup`, `pyenv` e `nvm` simplificaram bastante esse processo em diversos ecossistemas.

No mundo da [linguagem de programação Swift](https://www.swift.org/), a solução oficial para isso é o Swiftly, uma ferramenta moderna criada para instalar, atualizar e alternar entre diferentes versões do Swift no Linux de forma simples e prática.

Se você trabalha com servidores Linux, containers Docker, ambientes de testes ou precisa validar aplicações em diferentes versões da linguagem, o Swiftly pode facilitar bastante sua rotina.

## O que é o Swiftly?

O Swiftly é uma ferramenta de linha de comando desenvolvida em Swift que permite:

- Instalar diferentes versões do Swift.
- Alternar rapidamente entre toolchains.
- Atualizar versões instaladas.
- Remover versões antigas.
- Manter o ambiente Swift organizado.

Na prática, ele funciona de maneira semelhante ao `rustup` do Rust ou ao `nvm` do Node.js.

Além disso, o Swiftly é mantido oficialmente pela comunidade Swift e possui integração nativa com ambientes Linux.

## Por que usar o Swiftly no Linux?

Embora seja possível instalar o Swift diretamente pelos repositórios da distribuição Linux, utilizar o Swiftly oferece várias vantagens:

- Instalação simplificada.
- Acesso rápido às versões mais recentes.
- Facilidade para testar snapshots e versões beta.
- Gerenciamento centralizado das toolchains.
- Atualizações mais previsíveis.
- Melhor experiência para desenvolvimento backend.

Outro ponto importante é que muitas distribuições Linux possuem versões desatualizadas do Swift nos repositórios oficiais.

## Como instalar o Swiftly no Linux

A instalação do Swiftly é relativamente simples e funciona na maioria das distribuições Linux modernas.

## Instalando no Bash e Zsh

Se você utiliza `bash` ou `zsh`, execute:

```bash
curl -O https://download.swift.org/swiftly/linux/swiftly-$(uname -m).tar.gz && \
tar zxf swiftly-$(uname -m).tar.gz && \
./swiftly init --quiet-shell-followup && \
. "${SWIFTLY_HOME_DIR:-$HOME/.local/share/swiftly}/env.sh" && \
hash -r
````

Após a instalação, reinicie o terminal ou carregue novamente o shell.

## Instalando no Fish Shell

Para usuários do Fish Shell:

```bash
curl -O https://download.swift.org/swiftly/linux/swiftly-(uname -m).tar.gz && \
tar zxf swiftly-(uname -m).tar.gz && \
./swiftly init --quiet-shell-followup && \
set -q SWIFTLY_HOME_DIR && \
source "$SWIFTLY_HOME_DIR/env.fish" || source ~/.local/share/swiftly/env.fish
```

## Como instalar o Swift usando o Swiftly

Depois que o Swiftly estiver instalado, instalar o Swift passa a ser extremamente simples.

## Instalando a versão mais recente do Swift

Para instalar a versão estável mais recente:

```bash
swiftly install latest
```

## Instalando uma versão específica

Você também pode instalar versões específicas da linguagem:

```bash
swiftly install 6.0.1
```

Isso é bastante útil para ambientes legados ou testes de compatibilidade.

## Como alternar entre versões do Swift

Uma das melhores funcionalidades do Swiftly é a facilidade para alternar entre versões instaladas.

Para definir uma versão global:

```bash
swiftly use 5.10
```

Ou utilizar sempre a versão mais recente:

```bash
swiftly use latest
```

## Como listar versões instaladas

Para visualizar todas as versões instaladas no sistema:

```bash
swiftly list
```

## Como atualizar o Swift

Para atualizar a versão atual do Swift:

```bash
swiftly update
```

## Como remover versões antigas

Se quiser remover versões que não utiliza mais:

```bash
swiftly uninstall 5.9
```

Isso ajuda a manter o ambiente mais limpo e economizar espaço em disco.

## Como atualizar o próprio Swiftly

Além de atualizar as toolchains do Swift, também é possível atualizar o próprio Swiftly:

```bash
swiftly self-update
```

## Vale a pena usar o Swiftly?

Sim, principalmente para desenvolvedores que trabalham frequentemente com Linux, Docker, CI/CD ou múltiplos projetos Swift.

O Swiftly resolve vários problemas comuns relacionados a:

- Compatibilidade entre versões.
- Atualizações manuais.
- Instalações complexas.
- Gerenciamento de ambientes.
- Testes com snapshots.

Além disso, a ferramenta deixa o ambiente muito mais próximo da experiência encontrada em ecossistemas modernos como Rust e Node.js.

## Conclusão

O Swiftly é atualmente uma das melhores maneiras de instalar e gerenciar o Swift no Linux. A ferramenta simplifica bastante o gerenciamento de versões e oferece uma experiência muito mais moderna para desenvolvimento backend com Swift.

Se você pretende utilizar Swift em servidores Linux, containers ou ambientes de desenvolvimento mais avançados, vale muito a pena incorporar o Swiftly ao seu fluxo de trabalho.

## Referências

- [Documentação oficial do Swiftly](https://www.swift.org/swiftly/documentation/swiftlydocs/).
- [Repositório oficial do Swiftly no GitHub](https://github.com/swiftlang/swiftly/).
