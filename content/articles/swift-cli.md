---
title: Principais comandos do Swift CLI
summary: Aprenda os principais comandos do Swift CLI para criar projetos, compilar aplicações, executar testes, gerenciar dependências e aumentar sua produtividade no terminal.
tags: Swift, CLI, Swift Package Manager
date: 2026-05-05
---

Se você trabalha com a linguagem Swift, aprender os comandos da linha de comando é praticamente obrigatório. Além de aumentar a produtividade, dominar o Swift CLI ajuda a entender melhor o ecossistema da linguagem e o funcionamento do Swift Package Manager.

Embora muitos desenvolvedores utilizem o Xcode no dia a dia, boa parte das tarefas profissionais envolvendo Swift também acontece diretamente pelo terminal.

Neste guia, você vai conhecer os principais comandos do Swift CLI utilizados para:

- Criar projetos.
- Compilar aplicações.
- Executar testes.
- Gerenciar dependências.
- Executar scripts.
- Trabalhar com bibliotecas.
- Automatizar tarefas.

Além disso, esses comandos são extremamente comuns em:

- Ambientes Linux.
- CI/CD.
- Containers Docker.
- Servidores.
- Desenvolvimento backend.

## O que é o Swift CLI?

O Swift CLI (Command Line Interface) é a interface oficial de linha de comando da linguagem Swift.

Ela permite interagir diretamente com:

- Compilador Swift.
- Swift Package Manager.
- Sistema de build.
- Gerenciamento de dependências.
- Ferramentas de testes.

Tudo isso sem depender exclusivamente do Xcode.

Na prática, o terminal acaba se tornando uma das formas mais rápidas e eficientes de trabalhar com Swift.

## O que é o Swift Package Manager?

Grande parte dos comandos do Swift CLI está relacionada ao Swift Package Manager (SPM), o gerenciador oficial de pacotes da linguagem.

O SPM é responsável por:

- Criar projetos.
- Resolver dependências.
- Gerenciar bibliotecas.
- Compilar aplicações.
- Executar testes.

Atualmente, ele é o padrão do ecossistema Swift.

## Como verificar se o Swift está instalado

Antes de começar, verifique se o Swift está disponível no sistema:

```bash
swift --version
````

A saída será parecida com:

```bash
Swift version 6.x
Target: arm64-apple-macosx
```

Se o comando funcionar corretamente, o ambiente já está configurado.

## Principais comandos do Swift CLI

Abaixo estão os comandos mais importantes para o dia a dia de desenvolvimento.

## Como criar um projeto Swift

Para iniciar um novo projeto vazio:

```bash
swift package init
```

Esse comando cria a estrutura básica de um pacote Swift.

## Criando uma aplicação executável

Para criar um projeto executável:

```bash
swift package init --type executable
```

Esse é o formato mais comum para:

- Aplicações CLI.
- Ferramentas de terminal.
- Scripts avançados.
- Backends simples.

## Criando uma ferramenta CLI

O Swift também possui um template específico para ferramentas de linha de comando:

```bash
swift package init --type tool
```

Esse template normalmente já inclui integração com o Argument Parser.

## Criando uma biblioteca Swift

Para criar uma biblioteca reutilizável:

```bash
swift package init --type library
```

Esse formato é ideal para:

- SDKs.
- Frameworks.
- Módulos reutilizáveis.
- Bibliotecas open source.

## Como compilar projetos Swift

Depois de criar o projeto, utilize:

```bash
swift build
```

Esse comando:

- Resolve dependências.
- Compila o projeto.
- Gera os binários.
- Cria a estrutura de build.

O binário final normalmente fica em:

```bash
.build/debug/
```

## Como executar um projeto Swift

Você pode executar diretamente utilizando:

```bash
swift run
```

Esse comando compila e executa automaticamente o projeto.

Também é possível executar um alvo específico:

```bash
swift run nome-do-app
```

## Como executar scripts Swift

O Swift também pode ser utilizado como linguagem de scripting.

Crie um arquivo:

```swift
print("Olá, Swift!")
```

Depois execute:

```bash
swift arquivo.swift
```

Isso é bastante útil para:

- Scripts rápidos.
- Automação.
- Processamento de arquivos.
- Ferramentas internas.

## Como adicionar dependências no Swift

O Swift Package Manager possui suporte nativo para dependências.

Atualmente, uma das formas mais comuns é:

```bash
swift package add-dependency https://github.com/apple/swift-argument-parser
```

A dependência será adicionada automaticamente ao `Package.swift`.

## Como atualizar dependências

Para atualizar os pacotes instalados:

```bash
swift package update
```

Esse comando busca versões mais recentes respeitando as regras definidas no projeto.

## Como executar testes

Os testes automatizados podem ser executados com:

```bash
swift test
```

Esse comando:

- Compila os testes.
- Executa os testes unitários.
- Exibe falhas e resultados.

Os testes são fundamentais para projetos profissionais e pipelines de CI/CD.

## Como usar o modo interativo (REPL)

O Swift possui um ambiente interativo chamado REPL.

Para iniciar:

```bash
swift repl
```

O REPL é excelente para:

- Aprender Swift.
- Testar funções rapidamente.
- Validar expressões.
- Experimentar APIs.

## Como obter ajuda no Swift CLI

O Swift CLI possui documentação integrada.

Para visualizar os comandos disponíveis:

```bash
swift --help
```

Para ajuda de um subcomando específico:

```bash
swift help build
```

Ou:

```bash
swift build --help
```

Isso facilita bastante o aprendizado da ferramenta.

## Comandos mais usados no dia a dia

| Comando                | Função                  |
| ---------------------- | ----------------------- |
| `swift build`          | Compila o projeto       |
| `swift run`            | Executa a aplicação     |
| `swift test`           | Executa testes          |
| `swift package init`   | Cria um projeto         |
| `swift package update` | Atualiza dependências   |
| `swift repl`           | Inicia modo interativo  |
| `swift --version`      | Mostra versão instalada |
| `swift --help`         | Exibe ajuda             |

## Vale a pena aprender o Swift CLI?

Sim. Mesmo utilizando Xcode, conhecer os comandos do Swift CLI traz várias vantagens:

- Mais produtividade.
- Melhor entendimento do ecossistema Swift.
- Facilidade para automações.
- Desenvolvimento mais profissional.
- Melhor integração com Linux e servidores.
- Uso simplificado em Docker e CI/CD.

Além disso, muitos projetos backend em Swift dependem fortemente do terminal.

## Conclusão

O Swift CLI é uma das ferramentas mais importantes para qualquer desenvolvedor Swift.

Dominar os principais comandos ajuda não apenas no desenvolvimento local, mas também em automações, testes, servidores e ambientes profissionais.

Mesmo que você utilize o Xcode diariamente, aprender o terminal vai melhorar bastante sua produtividade e compreensão do ecossistema Swift.
