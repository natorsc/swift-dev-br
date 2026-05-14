---
title: Mint para Swift
summary: Gerencie e execute ferramentas Swift com facilidade
tags: Swift, Mint, Swift Package Manager, CLI
date: 2026-05-08
---

Se você desenvolve com a linguagem de programação Swift, provavelmente já precisou instalar ferramentas como o SwiftLint, XcodeGen, Sourcery ou Tuist.

Normalmente isso é feito via Homebrew ou manualmente, o que pode gerar problemas de versão, conflitos entre projetos e dificuldades no CI/CD.

É exatamente aí que entra o [Mint](https://github.com/yonaskolb/Mint): um package manager focado em instalar e executar ferramentas de linha de comando escritas em Swift.

## O que é o Mint?

O Mint é uma ferramenta criada para instalar e executar pacotes Swift executáveis usando o [Swift Package Manager](https://github.com/swiftlang/swift-package-manager) (SPM).

Com ele, você consegue:

- Instalar ferramentas Swift rapidamente.
- Utilizar versões específicas de uma ferramenta.
- Compartilhar configurações entre equipes.
- Evitar conflitos globais no sistema.
- Melhorar a reprodutibilidade do ambiente.
- Automatizar setup de projetos.

Exemplo simples:

```bash
mint run realm/SwiftLint
```

Esse comando instala e executa o SwiftLint automaticamente.

## Qual problema o Mint resolve?

Antes do Mint, muitas ferramentas Swift eram instaladas globalmente via Homebrew:

```bash
brew install swiftlint
```

O problema dessa abordagem é que:

- Apenas uma versão da ferramenta fica instalada.
- Projetos diferentes podem exigir versões diferentes.
- Times acabam utilizando versões inconsistentes.
- CI/CD pode gerar comportamentos diferentes do ambiente local.

O Mint resolve isso permitindo executar versões específicas de ferramentas Swift.

Por exemplo:

```bash
mint run realm/SwiftLint@0.55.1
```

Assim, você garante que todos utilizem exatamente a mesma versão.

## Como instalar o Mint

### Requisitos

Você precisa ter:

- Swift instalado.
- Xcode instalado no macOS.
- Swift Package Manager funcionando.

O SPM já vem integrado ao Swift moderno.

### Instalação via Homebrew

A forma mais simples:

```bash
brew install mint
```

### Instalação manual

Também é possível instalar compilando o projeto:

```bash
git clone https://github.com/yonaskolb/Mint.git
cd Mint
make
```

## Principais comandos do Mint

### Instalar uma ferramenta

```bash
mint install realm/SwiftLint
```

Isso instala e cria um link global da ferramenta.

### Executar uma ferramenta

```bash
mint run realm/SwiftLint
```

Se a ferramenta ainda não estiver instalada, o Mint faz isso automaticamente.

### Utilizar uma versão específica

Um dos maiores diferenciais do Mint:

```bash
mint run realm/SwiftLint@0.55.1
```

Isso evita incompatibilidades entre projetos.

### Listar pacotes instalados

```bash
mint list
```

### Remover um pacote

```bash
mint uninstall SwiftLint
```

## Trabalhando com Mintfile

O Mint possui suporte ao `Mintfile`, que funciona de forma parecida com um `Podfile` ou `Package.swift`.

Crie um arquivo chamado:

```bash
Mintfile
```

E adicione:

```bash
realm/SwiftLint@0.55.1
yonaskolb/XcodeGen@2.38.0
```

Agora toda a equipe pode instalar as ferramentas com:

```bash
mint bootstrap
```

Isso torna o ambiente muito mais consistente.

# #Exemplo real com SwiftLint

### Instalar

```bash
mint install realm/SwiftLint
```

### Executar

```bash
mint run swiftlint
```

### Executar lint em um projeto

```bash
mint run swiftlint lint
```

## Onde o Mint salva os pacotes?

Por padrão:

```bash
~/.mint
```

Os executáveis ficam em:

```bash
~/.mint/bin
```

Adicione ao PATH:

```bash
export PATH="$HOME/.mint/bin:$PATH"
```

No `~/.zshrc` ou `~/.bash_profile`.

## Mint vs Homebrew

| Recurso                   | Mint | Homebrew |
| ------------------------- | ---- | -------- |
| Controle de versão        | ✅   | ❌        |
| Múltiplas versões         | ✅   | ❌        |
| Focado em Swift           | ✅   | ❌        |
| Instalação global simples | ✅   | ✅       |
| Ideal para CI/CD          | ✅   | ⚠️       |
| Cache de builds           | ✅   | ❌        |

O próprio repositório do Mint destaca que o Homebrew possui limitações para controle de versões específicas de ferramentas Swift.

## Mint no CI/CD

O Mint funciona muito bem em pipelines automatizados.

Existe inclusive uma GitHub Action específica para ele: [setup-mint](https://github.com/marketplace/actions/setup-mint-swift-package-manager)

Exemplo:

```yaml
- uses: irgaly/setup-mint@v1
```

Ela pode:

- Instalar o Mint.
- Executar `mint bootstrap`.
- Cachear ferramentas.
- Melhorar velocidade do pipeline.

## Vantagens do Mint

### Versionamento consistente

Cada projeto pode utilizar suas próprias versões.

### Fácil onboarding

Novos desenvolvedores executam apenas:

```bash
mint bootstrap
```

E tudo fica configurado.

### Melhor integração com Swift

Como o Mint usa o Swift Package Manager, ele se integra naturalmente ao ecossistema Swift.

## Limitações do Mint

Apesar de muito útil, o Mint possui algumas limitações:

- Funciona apenas com pacotes Swift executáveis.
- Depende do Swift Package Manager.
- Algumas configurações podem variar no Linux.

## Quando usar Mint?

O Mint é excelente para:

- SwiftLint.
- XcodeGen.
- Sourcery.
- Tuist.
- SwiftFormat.
- Ferramentas CLI internas da empresa.

Principalmente em:

- Equipes grandes.
- Projetos com CI/CD.
- Ambientes com múltiplos projetos.
- Times que precisam de consistência de versões.

## Conclusão

O [Mint](https://github.com/yonaskolb/Mint) é uma das melhores ferramentas para gerenciamento de executáveis Swift.

Ele resolve problemas clássicos de versionamento, simplifica o setup de ambientes e melhora bastante a experiência de desenvolvimento em times Swift.

Se você trabalha com ferramentas CLI em Swift, vale muito a pena adicionar o Mint ao seu fluxo de desenvolvimento.

## Links úteis

- [Repositório oficial do Mint](https://github.com/yonaskolb/Mint)
- [Swift Package Manager](https://github.com/swiftlang/swift-package-manager)
- [GitHub Action setup-mint](https://github.com/marketplace/actions/setup-mint-swift-package-manager)
