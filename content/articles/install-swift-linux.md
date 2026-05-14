---
title: Como instalar a linguagem de programação Swift no Linux
summary: Aprenda como instalar a linguagem Swift no Linux utilizando os repositórios das principais distribuições.
tags: Swift, Linux
date: 2026-04-30
---

O Swift é uma linguagem de programação moderna criada pela Apple, inicialmente voltada para o desenvolvimento de aplicações para iOS e macOS. Entretanto, nos últimos anos, a linguagem evoluiu bastante e passou a oferecer excelente suporte para Linux, tornando-se uma ótima opção para desenvolvimento backend, microserviços e aplicações de linha de comando.

Hoje, já é possível utilizar o Swift no Linux de maneira relativamente simples, principalmente nas distribuições mais populares. Neste artigo, você vai aprender como instalar a linguagem Swift no Linux utilizando os repositórios oficiais da sua distribuição.

## Por que usar Swift no Linux?

O Swift vem ganhando espaço fora do ecossistema da Apple por oferecer:

- Sintaxe moderna e limpa.
- Excelente desempenho.
- Segurança de memória.
- Ótimo suporte para programação concorrente.
- Desenvolvimento de APIs REST e microserviços.
- Criação de aplicações CLI.
- Gerenciamento de dependências com Swift Package Manager.

Além disso, o Swift possui uma comunidade ativa e um ecossistema cada vez mais maduro para servidores Linux.

## Como instalar o Swift no Linux

A maneira mais simples de instalar o Swift no Linux é utilizando o gerenciador de pacotes da própria distribuição.

> É importante notar que a versão da linguagem de programação Swift pode variar bastante dependendo da distribuição Linux que se está utilizando.

### Instalando Swift no Debian e Ubuntu

Nas distribuições baseadas em Debian, como Ubuntu, execute:

```bash
sudo apt update && \
sudo apt install swiftlang
````

Em versões mais antigas da distribuição, pode ser necessário adicionar repositórios extras ou instalar manualmente os pacotes oficiais.

## Instalando Swift no Fedora

No Fedora, utilize:

```bash
sudo dnf install \
swift-lang
```

## Instalando Swift no Arch Linux

No Arch Linux, a instalação pode ser feita com:

```bash
sudo pacman -S \
swift
```

## Instalando Swift no openSUSE

No openSUSE, execute:

```bash
sudo zypper install \
swift
```

## Como verificar se o Swift foi instalado corretamente

Após concluir a instalação, verifique se o compilador está funcionando corretamente:

```bash
swift --version
```

A saída deve ser semelhante a:

```plaintext
Swift version 6.x
Target: x86_64-unknown-linux-gnu
```

Se o comando funcionar corretamente, significa que o Swift está instalado e pronto para uso.

## Criando o primeiro programa em Swift

Agora que o Swift está instalado, você pode criar um pequeno teste para validar o ambiente.

Crie um arquivo chamado `main.swift`:

```swift
print("Olá, Swift no Linux!")
```

Depois execute:

```bash
swift main.swift
```

O resultado será:

```plaintext
Olá, Swift no Linux!
```

## Vale a pena instalar via repositório?

Instalar o Swift pelos repositórios da distribuição é extremamente prático, principalmente para quem deseja começar rapidamente. Porém, existem algumas limitações:

- Algumas distribuições oferecem versões antigas.
- Recursos mais recentes podem demorar para chegar.
- Pode existir diferença entre versões dos pacotes.
- Nem todos os pacotes oficiais são mantidos pela comunidade da linguagem.

Para ambientes de desenvolvimento mais modernos, principalmente em produção, muitos desenvolvedores preferem utilizar os binários oficiais disponibilizados pela [Swift.org](https://www.swift.org).

## Conclusão

O Linux se tornou uma excelente plataforma para desenvolvimento com Swift. Com poucos comandos, já é possível instalar a linguagem e começar a desenvolver aplicações modernas, rápidas e seguras.

Se você deseja explorar o Swift além do desenvolvimento para iOS e macOS, utilizar Linux pode ser uma ótima escolha para servidores, APIs REST, ferramentas CLI e aplicações backend.
