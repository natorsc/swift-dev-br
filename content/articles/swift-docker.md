---
title: Como executar a linguagem Swift via Docker
summary: Executar a linguagem de programação Swift no seu computador pode ser muito mais simples usando Docker.
tags: Swift, Docker
date: 2026-05-06
---

Executar a linguagem de programação **Swift** no seu computador pode ser muito mais simples usando **Docker**.

Com poucos comandos, você cria um ambiente isolado, portátil e pronto para desenvolvimento, sem precisar instalar o Swift manualmente no sistema operacional.

Neste tutorial, você aprenderá como utilizar o **Swift via Docker**, desde o download da imagem oficial até a execução do seu primeiro programa Swift dentro de um contêiner.

Esse método é ideal para:

- Estudos e testes rápidos.
- Ambientes de desenvolvimento padronizados.
- Integração contínua (CI/CD).
- Desenvolvimento multiplataforma.
- Evitar conflitos de versões do Swift.

> Todo o processo também pode ser realizado com o **Podman**, já que ele é compatível com a maioria dos comandos Docker.

## O que você vai aprender

Neste artigo você verá como:

- Baixar a imagem oficial do Swift.
- Criar um contêiner Swift.
- Executar comandos Swift no Docker.
- Criar e rodar seu primeiro programa Swift.
- Persistir arquivos locais usando volumes.
- Utilizar Swift com Visual Studio Code.

## Recursos oficiais do Swift no Docker

Sempre utilize fontes oficiais para garantir segurança, estabilidade e compatibilidade.

- Docker Hub oficial do Swift: [https://hub.docker.com/_/swift](https://hub.docker.com/_/swift).
- Repositório oficial no GitHub: [https://github.com/swiftlang/swift-docker/tree/main](https://github.com/swiftlang/swift-docker/tree/main).

## Por que utilizar Swift com Docker?

O Docker oferece diversas vantagens para quem deseja trabalhar com Swift:

- Não precisa instalar o Swift localmente.
- Evita conflitos entre versões.
- Permite criar ambientes reproduzíveis.
- Funciona em macOS, Linux e Windows.
- Facilita a automação em pipelines CI/CD.

Além disso, o ambiente fica completamente isolado do sistema operacional principal.

## Como instalar o Docker

Caso ainda não tenha o Docker instalado, faça o download no site oficial:

[https://www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop).

Após a instalação, verifique se tudo está funcionando:

```bash
docker --version
```

Se a versão do Docker aparecer no terminal, a instalação foi concluída com sucesso.

## Como baixar a imagem oficial do Swift

Abra o terminal e execute:

```bash
docker pull swift
```

Esse comando baixa a imagem oficial mais recente do Swift disponível no Docker Hub.

Caso queira baixar uma versão específica:

```bash
docker pull swift:6.3
```

Você pode visualizar as imagens instaladas localmente com:

```bash
docker images
```

## Como criar um contêiner Swift

Agora vamos criar um contêiner interativo utilizando a imagem oficial do Swift.

```bash
docker run --interactive --tty \
--name swift-latest swift:latest /bin/bash
```

Após executar esse comando, você já estará dentro do ambiente Linux do contêiner.

### Explicação do comando

- `--interactive --tty`: mantém o terminal interativo.
- `--name swift-latest`: define um nome para o contêiner.
- `swift:latest`: utiliza a imagem oficial do Swift.
- `/bin/bash`: inicia um terminal Bash dentro do contêiner.

## Como verificar a instalação do Swift

Dentro do contêiner, execute:

```bash
swift --version
```

Você verá algo semelhante a:

```bash
Swift version 6.x
Target: x86_64-unknown-linux-gnu
```

Isso confirma que o ambiente está pronto para uso.

## Seu primeiro programa Swift no Docker

Agora vamos criar e executar um programa Swift simples.

### Criando o arquivo Swift

Crie um arquivo chamado `hello.swift`:

```bash
touch hello.swift
```

Depois abra o arquivo usando um editor disponível no contêiner:

```bash
nano hello.swift
```

Adicione o seguinte código:

```swift
print("Olá, Swift rodando no Docker!")
```

Salve o arquivo.

### Executando o programa Swift

Agora execute:

```bash
swift hello.swift
```

Saída esperada:

```bash
Olá, Swift rodando no Docker! 🚀
```

Pronto. Seu primeiro programa Swift foi executado dentro de um contêiner Docker.

### Como compilar um programa Swift

Além de executar scripts diretamente, você também pode compilar aplicações Swift.

Compile o arquivo:

```bash
swiftc hello.swift -o hello
```

Execute o binário gerado:

```bash
./hello
```

## Como persistir arquivos usando volumes

Por padrão, arquivos criados dentro do contêiner podem ser perdidos ao removê-lo. Para evitar isso, utilize volumes Docker.

Exemplo:

```bash
docker run --interactive --tty \
--volume $(pwd):/app \
--workdir /app \
swift:latest /bin/bash
```

O que esse comando faz:

- `$(pwd):/app`: compartilha a pasta atual com o contêiner.
- `--workdir /app`: define `/app` como diretório principal.

Assim, todos os arquivos Swift criados dentro do contêiner ficam salvos na sua máquina.

## Como iniciar um contêiner já existente

Se o contêiner já foi criado anteriormente:

```bash
docker start swift-latest
```

## Como acessar novamente o contêiner

Para acessar o terminal do contêiner em execução:

```bash
docker attach swift-latest
```

Outra alternativa mais moderna e recomendada:

```bash
docker exec -it swift-latest bash
```

## Como remover um contêiner Swift

Para remover o contêiner:

```bash
docker rm swift-latest
```

Se ele estiver em execução:

```bash
docker rm -f swift-latest
```

## Swift com Visual Studio Code

Você também pode utilizar o Swift com o Visual Studio Code para uma experiência mais produtiva.

Extensões recomendadas:

- Swift oficial: [https://marketplace.visualstudio.com/items?itemName=swiftlang.swift-vscode](https://marketplace.visualstudio.com/items?itemName=swiftlang.swift-vscode).
- Dev Containers: [https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers).

Com a extensão **Dev Containers**, o VS Code abre o projeto diretamente dentro do contêiner Docker, mantendo dependências e versões totalmente padronizadas.

## Exemplo de estrutura de projeto Swift no Docker

```text
meu-projeto/
├── Package.swift
├── Sources/
│   └── main.swift
└── Dockerfile
```

## Criando um projeto Swift Package

Dentro do contêiner, execute:

```bash
swift package init --type executable
```

Depois execute:

```bash
swift run
```

## Vantagens de usar Swift no Docker

Utilizar Swift com Docker oferece diversos benefícios:

- Ambiente totalmente isolado.
- Fácil compartilhamento entre equipes.
- Configuração rápida.
- Compatibilidade entre sistemas operacionais.
- Excelente para testes automatizados.
- Ótimo para aprendizado e experimentação.

## Conclusão

Executar Swift via Docker é uma excelente alternativa para quem deseja desenvolver sem instalações complexas ou conflitos de versões.

Com poucos comandos, você consegue:

- Criar um ambiente Swift completo.
- Executar scripts rapidamente.
- Compilar aplicações.
- Compartilhar projetos facilmente.
- Padronizar ambientes de desenvolvimento.

Se você trabalha com Swift em diferentes máquinas ou deseja um ambiente limpo e reproduzível, o Docker pode simplificar bastante o seu fluxo de trabalho.
