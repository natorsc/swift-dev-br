---
title: Swift Package Manager os principais comandos para gerenciar dependências em projetos Swift
summary: Swift Package Manager os principais comandos para gerenciar dependências em projetos Swift.
tags: Swift
date: 2026-10-04
---

Quem vem do Python provavelmente está acostumado a ferramentas como `pip`, `pip-tools` ou `uv` para instalar e atualizar dependências.

No ecossistema Swift, a ferramenta responsável por essa tarefa é o **Swift Package Manager (SwiftPM)**, normalmente chamado simplesmente de **SPM**.

Além de gerenciar dependências, o SwiftPM também consegue criar projetos, compilar o código, executar testes, executar produtos e resolver a árvore completa de dependências.

Neste artigo vamos conhecer os principais comandos do Swift Package Manager e principalmente, entender como:

- Criar um pacote Swift.
- Adicionar uma nova dependência.
- Atualizar dependências.
- Verificar quais dependências podem ser atualizadas.
- Visualizar a árvore de dependências.
- Entender o papel do `Package.swift`.
- Entender o `Package.resolved`.
- Remover ou alterar dependências.
- Limpar o projeto.
- Diagnosticar problemas de resolução.

> **Nota:** os exemplos deste artigo utilizam a linha de comando `swift package`, disponível junto ao toolchain da linguagem de programação Swift.

---

## O que é o Swift Package Manager?

O Swift Package Manager é o gerenciador de dependências oficial do Swift.

Ele é distribuído junto com o Swift e não precisa ser instalado separadamente quando instalamos um toolchain completo do Swift.

Sua função é administrar pacotes Swift e suas dependências, resolvendo versões compatíveis e preparando tudo o que é necessário para compilar o projeto.

A própria documentação do Swift descreve o papel do Package Manager como o responsável por baixar, resolver e construir as dependências de um projeto.

Se você vem do Python, podemos fazer uma primeira aproximação:

| Python | Swift |
|---|---|
| `pip` | Swift Package Manager |
| `uv add` | `swift package add-dependency` |
| `uv sync` | `swift package resolve` |
| `uv lock` | `Package.resolved` |
| `uv run` | `swift run` |
| `pytest` | `swift test` |
| `pip install` | resolução das dependências pelo SwiftPM |

A comparação é útil, mas não perfeita. O SwiftPM possui responsabilidades que no Python normalmente ficam distribuídas entre várias ferramentas.

---

## 1. Criando um novo pacote

Podemos começar um projeto Swift usando:

```bash
swift package init
```

Por padrão, o comando cria um pacote de biblioteca.

Também podemos especificar o tipo:

```bash
swift package init --type executable
```

Nesse caso teremos um executável.

Por exemplo:

```bash
mkdir MeuProjeto
cd MeuProjeto

swift package init --type executable
```

O SwiftPM criará uma estrutura semelhante a:

```bash
MeuProjeto/
├── Package.swift
├── Sources/
│   └── MeuProjeto/
│       └── main.swift
└── Tests/
    └── MeuProjetoTests/
```

O arquivo mais importante nesse momento é:

```bash
Package.swift
```

Ele funciona como o manifesto do projeto.

---

## 2. O `Package.swift`

O `Package.swift` descreve o pacote, seus produtos, targets e dependências.

Um exemplo simples:

```swift
// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "MeuProjeto",
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-argument-parser.git",
            from: "1.5.0"
        )
    ],
    targets: [
        .executableTarget(
            name: "MeuProjeto",
            dependencies: [
                .product(
                    name: "ArgumentParser",
                    package: "swift-argument-parser"
                )
            ]
        )
    ]
)
```

Aqui temos duas partes importantes.

A primeira declara **de onde vem a dependência e qual versão é aceita**:

```swift
.package(
    url: "https://github.com/apple/swift-argument-parser.git",
    from: "1.5.0"
)
```

A segunda informa que o nosso target utiliza um produto fornecido por esse pacote:

```swift
.product(
    name: "ArgumentParser",
    package: "swift-argument-parser"
)
```

Essa separação entre **package** e **product** é importante no SwiftPM e pode parecer diferente para quem está acostumado com Python.

---

## 3. Adicionando uma dependência pela linha de comando

Nas versões modernas do SwiftPM podemos adicionar uma dependência diretamente pela CLI:

```bash
swift package add-dependency https://github.com/apple/swift-argument-parser.git
```

Também podemos especificar uma versão:

```bash
swift package add-dependency \
    https://github.com/apple/swift-argument-parser.git \
    --from 1.5.0
```

Isso é particularmente interessante para quem está acostumado com:

```bash
uv add requests
```

ou:

```bash
pip install requests
```

A ideia é semelhante, mas o resultado no Swift é refletido no manifesto `Package.swift`.

O SwiftPM também suporta diferentes formas de declarar requisitos de versão, como versões mínimas, intervalos e branches.

Por exemplo:

```swift
.package(
    url: "https://github.com/example/library.git",
    from: "2.0.0"
)
```

Significa, de forma simplificada:

> Use a versão 2.0.0 ou outra versão compatível dentro das regras de versionamento.

---

## 4. `swift package resolve`

Depois de modificar as dependências, podemos pedir explicitamente ao SwiftPM para resolver a árvore de dependências:

```bash
swift package resolve
```

Esse comando é particularmente útil quando queremos garantir que todas as dependências estejam resolvidas.

Por exemplo:

```bash
Package.swift
      │
      ├── Vapor
      │     ├── swift-nio
      │     ├── swift-log
      │     └── ...
      │
      └── Fluent
            └── ...
```

O SwiftPM precisa encontrar versões compatíveis para toda essa árvore.

Esse processo é chamado de **dependency resolution**.

---

## 5. `Package.resolved`: o arquivo de versões resolvidas

Uma das coisas mais importantes para entender no SwiftPM é a diferença entre:

```bash
Package.swift
```

e:

```bash
Package.resolved
```

O `Package.swift` descreve **quais dependências e requisitos de versão o projeto aceita**.

Já o `Package.resolved` registra **quais versões concretas foram resolvidas**.

Por exemplo, o manifesto pode dizer:

```swift
.package(
    url: "https://github.com/vapor/vapor.git",
    from: "4.0.0"
)
```

Enquanto o `Package.resolved` registra a versão específica que foi escolhida.

Isso permite que diferentes máquinas e ambientes de desenvolvimento trabalhem com a mesma resolução de dependências.

A documentação do Swift confirma que `Package.resolved` funciona como um snapshot das versões exatas das dependências utilizadas pelo projeto.

Uma maneira simples de pensar é:

```bash
Package.swift
    ↓
"Quais versões são permitidas?"

Package.resolved
    ↓
"Quais versões foram escolhidas?"
```

---

## 6. Atualizando as dependências

Um dos comandos mais importantes é:

```bash
swift package update
```

Ele solicita ao SwiftPM que atualize as dependências para as versões mais recentes permitidas pelas regras especificadas no `Package.swift`.

Por exemplo, se temos:

```swift
from: "4.0.0"
```

o SwiftPM poderá atualizar para uma versão mais recente compatível com esse requisito.

Depois da atualização, o `Package.resolved` será atualizado.

Podemos então verificar:

```bash
git diff Package.resolved
```

para descobrir exatamente quais versões foram alteradas.

---

## 7. Como descobrir se existem dependências desatualizadas?

Aqui existe uma diferença importante em relação a ferramentas como `uv`.

O SwiftPM possui:

```bash
swift package update
```

E nas versões atuais, também disponibiliza:

```bash
swift package update --dry-run
```

O `--dry-run` permite verificar quais dependências podem ser atualizadas sem realizar a atualização efetiva da resolução.

Portanto, podemos utilizar:

```bash
swift package update --dry-run
```

como uma primeira verificação.

Por exemplo, podemos encontrar uma saída indicando que determinadas dependências possuem uma resolução diferente disponível.

Isso é especialmente útil antes de executar `swift package update` em um projeto.

### Uma ressalva importante

O `swift package update` trabalha dentro das restrições definidas pelo projeto.

Imagine que uma biblioteca esteja atualmente na versão:

```bash
1.8.0
```

e que exista:

```bash
1.9.0
2.0.0
```

Se o `Package.swift` permitir apenas a série `1.x`, o SwiftPM não vai simplesmente pular para a versão `2.0.0`.

Isso é desejável porque uma nova major version pode conter breaking changes.

---

## 8. E se quisermos saber se existe uma nova major version?

Aqui está uma diferença importante entre o SwiftPM e ferramentas que possuem comandos específicos de `outdated`.

O SwiftPM não deve ser tratado como se tivesse um equivalente nativo perfeito a:

```bash
npm outdated
```

ou ferramentas especializadas de auditoria de versões.

Para esse cenário existem ferramentas externas, como o **SwiftOutdated**, que pode mostrar a versão atual e a versão mais recente disponível, inclusive quando a versão mais nova está fora das restrições atuais do projeto.

Depois de instalado, ele pode ser utilizado como:

```bash
swift outdated
```

Um exemplo de saída é:

```bash
Package                 Current    Latest
------------------------------------------
swift-argument-parser   1.1.4      1.2.2
rainbow                 3.2.0      4.0.1
```

Isso é particularmente útil para descobrir:

> "Meu projeto está usando uma versão antiga, mas o `swift package update` não está chegando nela. Por quê?"

Normalmente a resposta está nas restrições de versão do `Package.swift`.

---

## 9. Visualizando todas as dependências

Outro comando extremamente útil é:

```bash
swift package show-dependencies
```

Ele mostra a árvore de dependências do projeto.

Imagine que o projeto dependa de:

```bash
Vapor
└── swift-nio
    ├── swift-collections
    └── swift-system
```

Isso ajuda a entender por que um projeto aparentemente pequeno pode acabar baixando dezenas de pacotes.

Essa visualização também é muito útil quando aparece um conflito de versões.

Por exemplo:

```bash
MeuProjeto
├── Vapor
│   └── swift-nio
└── OutraBiblioteca
    └── swift-nio
```

Podemos então investigar se as duas dependências estão exigindo versões incompatíveis do mesmo pacote.

---

## 10. Compilando o projeto

O comando mais básico para compilar é:

```bash
swift build
```

Por padrão, a compilação ocorre no modo de desenvolvimento.

Também podemos utilizar:

```bash
swift build -c release
```

para uma compilação otimizada para produção.

Em versões recentes do Swift, o Swift Build passou a ser o sistema de build padrão do Swift Package Manager.

Isso foi uma das mudanças destacadas no lançamento do Swift 6.4.

---

## 11. Executando o projeto

Se o projeto possui um executable target, podemos utilizar:

```bash
swift run
```

Ou especificar o executável:

```bash
swift run MeuProjeto
```

Isso é muito semelhante à ideia de `uv run` no mundo Python.

Por exemplo:

```bash
swift run
```

pode compilar as dependências necessárias e executar o programa.

---

## 12. Executando os testes

Para executar os testes:

```bash
swift test
```

Também podemos executar uma compilação otimizada:

```bash
swift test -c release
```

Durante o desenvolvimento, o fluxo básico pode ser:

```bash
swift build
swift test
swift run
```

---

## 13. Limpando os arquivos de build

Se começarmos a encontrar problemas estranhos relacionados ao build, uma das primeiras opções é:

```bash
swift package clean
```

Esse comando limpa os artefatos de compilação.

Também existe:

```bash
swift package reset
```

que realiza uma limpeza mais agressiva do estado gerenciado pelo SwiftPM.

Em situações em que o projeto parece estar usando algum estado antigo ou inconsistente, esses comandos podem ser bastante úteis.

---

## 14. Removendo uma dependência

É importante conhecer também a operação inversa de adicionar uma dependência.

O SwiftPM possui:

```bash
swift package remove-dependency
```

Por exemplo:

```bash
swift package remove-dependency https://github.com/example/library.git
```

Entretanto, remover uma dependência do manifesto não significa necessariamente remover todas as referências ao produto dentro dos targets.

Se o projeto ainda possuir algo como:

```swift
.product(
    name: "Library",
    package: "library"
)
```

também será necessário remover essa referência do target.

Portanto, depois de remover uma dependência, vale verificar o `Package.swift`.

---

## 15. Descobrindo informações sobre o pacote

Podemos pedir ajuda diretamente ao SwiftPM:

```bash
swift package --help
```

E também:

```bash
swift package <comando> --help
```

Por exemplo:

```bash
swift package update --help
```

ou:

```bash
swift package add-dependency --help
```

Essa é uma ótima prática para descobrir opções disponíveis na versão do Swift instalada na sua máquina.

Também podemos descobrir a versão do Swift:

```bash
swift --version
```

---

## 16. Inspecionando o manifesto

Outro comando interessante é:

```bash
swift package dump-package
```

Ele apresenta uma representação estruturada do `Package.swift`.

Isso pode ser bastante útil para ferramentas, scripts e diagnósticos.

Por exemplo:

```bash
swift package dump-package
```

pode ajudar a descobrir quais targets e dependências o SwiftPM está efetivamente enxergando no manifesto.

---

## 17. Alterando a versão do Swift Tools

O começo do `Package.swift` normalmente possui algo semelhante a:

```swift
// swift-tools-version: 6.4
```

Essa linha define a versão mínima das ferramentas Swift necessárias para interpretar o manifesto.

Podemos consultar a versão atual:

```bash
swift package tools-version
```

E, quando apropriado, atualizar o manifesto para a versão corrente:

```bash
swift package tools-version --set-current
```

O SwiftPM utiliza essa informação durante a resolução das dependências e para determinar quais recursos do manifesto podem ser utilizados.

---

## 18. Comandos essenciais

Se você estiver trabalhando diariamente com Swift, não precisa decorar dezenas de comandos.

Estes já cobrem grande parte do trabalho:

```bash
# Criar um pacote
swift package init

# Criar um executável
swift package init --type executable

# Adicionar dependência
swift package add-dependency URL

# Resolver dependências
swift package resolve

# Ver dependências
swift package show-dependencies

# Ver atualizações possíveis
swift package update --dry-run

# Atualizar dependências
swift package update

# Compilar
swift build

# Compilar para produção
swift build -c release

# Executar
swift run

# Testar
swift test

# Limpar build
swift package clean

# Inspecionar o manifesto
swift package dump-package

# Ver a versão do Swift
swift --version

# Ver ajuda
swift package --help
```

---
