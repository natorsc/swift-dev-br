---
title: Como instalar a linguagem de programação Swift no Windows
summary: Aprenda como instalar o Swift no Windows passo a passo utilizando WinGet e Visual Studio.
tags: Swift, Windows
date: 2026-04-29
---

Instalar a linguagem de programação **Swift no Windows** ficou muito mais simples nos últimos anos.

Embora o Swift seja amplamente conhecido pelo desenvolvimento de aplicativos para o ecossistema da Apple, atualmente a linguagem possui suporte oficial para Windows, permitindo criar aplicações desktop, ferramentas de linha de comando e projetos server-side.

Neste tutorial você vai aprender:

- Como preparar o Windows para instalar o Swift.
- Como instalar as dependências necessárias.
- Como instalar o Swift utilizando o WinGet.
- Como verificar se a instalação foi concluída corretamente.
- Como executar o primeiro programa em Swift no Windows.

## Requisitos para instalar o Swift no Windows

Antes de iniciar a instalação do Swift, é recomendado:

- Utilizar o Windows 10 ou Windows 11 atualizado.
- Possuir privilégios de administrador no sistema.
- Ter conexão com a internet para baixar os componentes necessários.
- Utilizar o Windows Terminal ou PowerShell.

## Ativando o modo desenvolvedor no Windows

O modo desenvolvedor ajuda a evitar problemas relacionados a permissões e instalação de ferramentas de desenvolvimento.

No Windows, acesse:

```plaintext
Configurações -> Sistema -> Para desenvolvedores
```

Depois:

- Ative a opção Modo Desenvolvedor.

## Instalando as dependências necessárias

O Swift no Windows depende de ferramentas do compilador C++ e do SDK oficial da Microsoft.

A maneira mais simples de instalar todos os componentes corretamente é utilizando o **WinGet**, o gerenciador de pacotes oficial do Windows.

## Instalando o Visual Studio com os componentes necessários

Abra o **PowerShell como administrador*- e execute o comando abaixo:

```bash
winget install `
--id `
Microsoft.VisualStudio.2022.Community `
--exact `
--force `
--custom "--add Microsoft.VisualStudio.Component.Windows11SDK.22621 --add Microsoft.VisualStudio.Component.VC.Tools.x86.x64 --add Microsoft.VisualStudio.Component.VC.Tools.ARM64" `
--source winget
```

Esse comando instala:

- SDK do Windows 11.
- Compiladores `C++` `x86` e `x64`.
- Ferramentas `ARM64`.
- Componentes necessários para o toolchain do Swift.

A instalação pode demorar alguns minutos dependendo da velocidade da internet e do desempenho do computador.

## Instalando o Swift no Windows via WinGet

Após finalizar a instalação do Visual Studio, execute o seguinte comando:

```bash
winget install --id Swift.Toolchain -e --source winget
```

Esse comando instala a versão oficial do Swift compatível com Windows.

## Verificando se o Swift foi instalado corretamente

Depois que a instalação terminar:

- Feche o PowerShell.
- Abra um novo terminal.
- Execute o comando abaixo.

```bash
swift --version
```

Se tudo estiver funcionando corretamente, você verá uma saída semelhante a esta:

```bash
Swift version 6.3 (swift-6.3-RELEASE)
Target: x86_64-unknown-windows-msvc
Build config: +assertions
```

## Criando o primeiro programa em Swift no Windows

Agora crie um arquivo chamado `hello.swift` com o seguinte conteúdo:

```swift
print("Olá, mundo!")
```

Depois execute:

```bash
swift hello.swift
```

Se o terminal exibir:

```bash
Olá, mundo!
```

Isso significa que o Swift foi instalado corretamente no Windows.

## Problemas comuns ao instalar Swift no Windows

### O comando `swift` não é reconhecido

Se o terminal informar que o comando `swift` não foi encontrado:

- Feche e abra novamente o terminal.
- Verifique se o Swift foi adicionado corretamente ao PATH.
- Reinicie o computador se necessário.

### Erro relacionado ao MSVC

Caso apareçam erros relacionados ao compilador da Microsoft:

- Verifique se os componentes C++ do Visual Studio foram instalados corretamente.
- Certifique-se de que o SDK do Windows foi instalado.
- Atualize o Visual Studio para a versão mais recente.

## Vale a pena usar Swift no Windows?

Sim. O suporte do Swift para Windows evoluiu bastante nos últimos anos.

Hoje é possível utilizar a linguagem para:

- Desenvolvimento de ferramentas CLI.
- Aplicações server-side.
- Estudos da linguagem Swift.
- Projetos multiplataforma.
- Desenvolvimento de bibliotecas.

Além disso, o Swift oferece excelente desempenho, sintaxe moderna e alta segurança.

# Conclusão

Instalar a linguagem de programação Swift no Windows é um processo relativamente simples quando utilizamos as ferramentas corretas.

Com o WinGet, Visual Studio e o toolchain oficial do Swift, você consegue preparar rapidamente um ambiente moderno para desenvolvimento.

Agora que o Swift está instalado no seu computador, você já pode começar a criar aplicações e explorar todos os recursos da linguagem.
