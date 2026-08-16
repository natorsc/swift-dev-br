---
title: Awesome Swift
summary: Uma seleção curada dos principais frameworks, bibliotecas e ferramentas modernas para Swift.
tags: Swift
date: 2026-08-15
---

# Awesome Swift

Uma seleção curada de **frameworks, bibliotecas, ferramentas e projetos incríveis para Swift**.

A lista prioriza projetos modernos, bem mantidos e interessantes para desenvolvimento de aplicações **macOS, iOS, Linux, Web, Server-Side Swift, WebAssembly e multiplataforma**.

> Swift não é apenas uma linguagem para desenvolver aplicativos Apple. O ecossistema atual permite construir servidores, APIs, sites, ferramentas CLI, aplicações multiplataforma e até aplicações WebAssembly.

---

## Conteúdo

- [Web & Server-Side](#web--server-side).
- [HTML & Templates](#html--templates).
- [Static Site Generators](#static-site-generators).
- [Frontend & WebAssembly](#frontend--webassembly).
- [Multiplatform UI](#multiplatform-ui).
- [Networking](#networking).
- [Database & Persistence](#database--persistence).
- [Concurrency & Async](#concurrency--async).
- [CLI & Terminal](#cli--terminal).
- [Architecture & State Management](#architecture--state-management).
- [Dependency Injection](#dependency-injection).
- [Serialization & Data](#serialization--data).
- [Testing](#testing).
- [Logging & Observability](#logging--observability).
- [Developer Tools](#developer-tools).
- [Package Management](#package-management).
- [AI & Machine Learning](#ai--machine-learning).
- [Graphics, Games & Media](#graphics-games--media).
- [Resources](#resources).

---

## Web & Server-Side

Frameworks para construir APIs, aplicações web e servidores utilizando Swift.

- [Vapor](https://github.com/vapor/vapor): Framework HTTP para Server-Side Swift, com suporte a routing, middleware, autenticação, WebSockets, Fluent e muito mais.
- [Hummingbird](https://github.com/hummingbird-project/hummingbird): Framework web leve e moderno para construir servidores HTTP em Swift.
- [FlyingFox](https://github.com/swhitty/FlyingFox): Servidor HTTP simples e leve escrito em Swift.
- [Swifter](https://github.com/httpswift/swifter): Tiny HTTP server engine para Swift.
- [Kitura](https://github.com/Kitura/Kitura): Framework histórico para desenvolvimento server-side em Swift.
- [Perfect](https://github.com/PerfectlySoft/Perfect): Toolkit para desenvolvimento de servidores, APIs e aplicações web em Swift.

---

## HTML & Templates

Bibliotecas para gerar HTML diretamente em Swift.

- [Elementary](https://github.com/elementary-swift/elementary): Biblioteca moderna e eficiente para renderização de HTML, inspirada no SwiftUI.
- [Plot](https://github.com/JohnSundell/Plot): DSL type-safe para gerar HTML, XML e RSS.
- [Swim](https://github.com/loopwerk/swim): DSL para criação de HTML em Swift.
- [HTMLKit](https://github.com/vsanthanam/HTMLKit): Biblioteca para trabalhar com HTML em Swift.
- [SwiftHTML](https://github.com/pointfreeco/swift-html): DSL para geração de HTML type-safe.
- [Stencil](https://github.com/stencilproject/Stencil): Template language inspirada em Jinja/Django templates.
- [Leaf](https://github.com/vapor/leaf): Template engine do ecossistema Vapor.

---

## Static Site Generators

Ferramentas para criar sites estáticos utilizando Swift.

- [Saga](https://github.com/loopwerk/Saga): Gerador de sites estáticos code-first escrito em Swift.
- [Publish](https://github.com/JohnSundell/Publish): Static site generator extensível criado por John Sundell.
- [Ignite](https://github.com/twostraws/Ignite): Framework para criação de websites usando Swift.
- [Ink](https://github.com/JohnSundell/Ink): Markdown parser em Swift.

---

## Frontend & WebAssembly

Frameworks que permitem utilizar Swift diretamente no navegador.

- [ElementaryUI](https://github.com/elementary-swift/elementary-ui): Framework reativo para construir interfaces web em Swift e WebAssembly.
- [Tokamak](https://github.com/TokamakUI/Tokamak): Framework declarativo inspirado no SwiftUI para aplicações multiplataforma.
- [SwiftWebUI](https://github.com/SwiftWebUI/SwiftWebUI): Implementação experimental de SwiftUI para a Web.
- [JavaScriptKit](https://github.com/swiftwasm/JavaScriptKit): Interop entre Swift/Wasm e JavaScript.
- [WebKit](https://developer.apple.com/documentation/webkit): APIs da Apple para integração com tecnologias web.

---

## Multiplatform UI

Frameworks para criar interfaces além das APIs tradicionais da Apple.

- [SwiftUI](https://developer.apple.com/xcode/swiftui/): Framework declarativo oficial da Apple.
- [QtBridge for Swift](https://github.com/qt/qtbridge-swift): Bridge entre Swift e Qt Quick.
- [Tokamak](https://github.com/TokamakUI/Tokamak): UI declarativa multiplataforma inspirada em SwiftUI.
- [SwiftCrossUI](https://github.com/stackotter/swift-cross-ui): Framework de UI multiplataforma para Swift.
- [Skip](https://skip.dev/): Desenvolvimento multiplataforma utilizando Swift para iOS e Android.

---

## Networking

Bibliotecas para HTTP, WebSockets, APIs e comunicação de rede.

- [AsyncHTTPClient](https://github.com/swift-server/async-http-client): HTTP client assíncrono baseado em SwiftNIO.
- [Alamofire](https://github.com/Alamofire/Alamofire): HTTP networking elegante para Swift.
- [URLSession](https://developer.apple.com/documentation/foundation/urlsession): API nativa da Apple para networking.
- [Moya](https://github.com/Moya/Moya): Abstração sobre APIs de networking.
- [gRPC Swift](https://github.com/grpc/grpc-swift): Implementação de gRPC para Swift.
- [WebSocketKit](https://github.com/vapor/websocket-kit): WebSockets para o ecossistema Vapor/SwiftNIO.

---

## Database & Persistence

- [Fluent](https://github.com/vapor/fluent): ORM para Swift, utilizado principalmente com Vapor.
- [GRDB.swift](https://github.com/groue/GRDB.swift): Toolkit SQLite para Swift.
- [SwiftData](https://developer.apple.com/documentation/swiftdata): Framework moderno de persistência da Apple.
- [Core Data](https://developer.apple.com/documentation/coredata): Framework de persistência da Apple.
- [SQLite.swift](https://github.com/stephencelis/SQLite.swift): Wrapper type-safe para SQLite.
- [Realm Swift](https://github.com/realm/realm-swift): Database orientado a objetos para aplicações Swift.

---

## Concurrency & Async

- [Swift Concurrency](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/concurrency/): `async/await`, actors, tasks e structured concurrency.
- [SwiftNIO](https://github.com/apple/swift-nio): Framework assíncrono e event-driven da Apple.
- [AsyncAlgorithms](https://github.com/apple/swift-async-algorithms): Algoritmos para `AsyncSequence`.
- [Atomics](https://github.com/apple/swift-atomics): Operações atômicas de baixo nível para Swift.
- [Synchronization](https://github.com/apple/swift-synchronization): Primitivas modernas de sincronização.

---

## CLI & Terminal

Swift também é excelente para construir ferramentas de linha de comando.

- [ArgumentParser](https://github.com/apple/swift-argument-parser): Framework oficial da Apple para criação de CLI.
- [SwiftShell](https://github.com/kareman/SwiftShell): Execução de comandos shell diretamente em Swift.
- [ShellOut](https://github.com/JohnSundell/ShellOut): Interface simples para executar comandos shell.
- [Rainbow](https://github.com/onevcat/Rainbow): Cores e estilos ANSI no terminal.
- [Spectre](https://github.com/kylef/Spectre): Interface para construir aplicações CLI interativas.

---

## Architecture & State Management

- [The Composable Architecture](https://github.com/pointfreeco/swift-composable-architecture): Arquitetura para aplicações Swift com composição, estado, efeitos e testes.
- [ReSwift](https://github.com/ReSwift/ReSwift): Implementação do padrão Redux para Swift.
- [SwiftState](https://github.com/React-Swift/SwiftState): State machines para Swift.
- [Perception](https://github.com/pointfreeco/swift-perception): Observation compatível com versões anteriores dos sistemas Apple.

---

## Dependency Injection

- [Factory](https://github.com/hmlongco/Factory): Dependency injection container moderno para Swift.
- [Needle](https://github.com/uber/needle): Dependency injection type-safe em tempo de compilação.
- [Swinject](https://github.com/Swinject/Swinject): Dependency injection framework para Swift.

---

## Serialization & Data

- [Codable](https://developer.apple.com/documentation/swift/codable): Sistema nativo de codificação e decodificação de dados.
- [Swift Codable](https://github.com/apple/swift): APIs nativas para serialização.
- [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON): Manipulação simplificada de JSON.
- [Yams](https://github.com/jpsim/Yams): Parser e serializer YAML para Swift.
- [XMLCoder](https://github.com/MaxDesiatov/XMLCoder): Codificação e decodificação XML utilizando Codable.

---

## Testing

- [Swift Testing](https://github.com/swiftlang/swift-testing): Framework moderno de testes da Swift.
- [XCTest](https://developer.apple.com/documentation/xctest): Framework tradicional de testes da Apple.
- [Quick](https://github.com/Quick/Quick): Behavior-driven development para Swift.
- [Nimble](https://github.com/Quick/Nimble): Matcher framework para testes expressivos.
- [SnapshotTesting](https://github.com/pointfreeco/swift-snapshot-testing): Snapshot testing para Swift.

---

## Logging & Observability

- [swift-log](https://github.com/apple/swift-log): API de logging multiplataforma para Swift.
- [swift-metrics](https://github.com/apple/swift-metrics): API de métricas para Swift Server.
- [swift-distributed-tracing](https://github.com/apple/swift-distributed-tracing): APIs para distributed tracing.
- [OSLog](https://developer.apple.com/documentation/os/oslog): Sistema de logging nativo das plataformas Apple.

---

## Developer Tools

Ferramentas para melhorar o desenvolvimento e manutenção de projetos Swift.

- [SwiftLint](https://github.com/realm/SwiftLint): Linter para Swift.
- [SwiftFormat](https://github.com/nicklockwood/SwiftFormat): Formatter de código Swift.
- [SwiftSyntax](https://github.com/swiftlang/swift-syntax): Parser e infraestrutura para trabalhar com código Swift.
- [Swift Macro Testing](https://github.com/pointfreeco/swift-macro-testing): Ferramentas para testar Swift macros.
- [Tuist](https://github.com/tuist/tuist): Automação e geração de projetos Xcode.
- [XcodeGen](https://github.com/yonaskolb/XcodeGen): Geração de projetos Xcode a partir de YAML.
- [xcbeautify](https://github.com/cpisciotta/xcbeautify): Formatação da saída do `xcodebuild`.
- [xcodes](https://github.com/XcodesOrg/xcodes): Instalação e gerenciamento de versões do Xcode.
- [SourceKit-LSP](https://github.com/swiftlang/sourcekit-lsp): Language Server Protocol para Swift.

---

## Package Management

- [Swift Package Manager](https://github.com/swiftlang/swift-package-manager): Gerenciador oficial de dependências do Swift.
- [Swift Package Index](https://swiftpackageindex.com/): Índice de pacotes Swift.
- [Carthage](https://github.com/Carthage/Carthage): Gerenciador de dependências descentralizado.
- [Mint](https://github.com/yonaskolb/Mint): Instalação e execução de Swift CLI tools.

---

## AI & Machine Learning

- [Core ML](https://developer.apple.com/documentation/coreml): Machine learning on-device nas plataformas Apple.
- [Create ML](https://developer.apple.com/machine-learning/create-ml/): Criação de modelos de machine learning.
- [MLX Swift](https://github.com/ml-explore/mlx-swift): Framework Swift para machine learning baseado no MLX.
- [Swift Transformers](https://github.com/huggingface/swift-transformers): Transformers para Swift.
- [swift-openai](https://github.com/jamesrochabrun/SwiftOpenAI): Integração com APIs de modelos de IA.
- [PythonKit](https://github.com/pvieito/PythonKit): Integração entre Swift e Python.

---

## Graphics, Games & Media

- [SpriteKit](https://developer.apple.com/spritekit/): Framework 2D da Apple para jogos.
- [SceneKit](https://developer.apple.com/scenekit/): Framework 3D da Apple.
- [RealityKit](https://developer.apple.com/augmented-reality/realitykit/): Desenvolvimento 3D e spatial computing.
- [Metal](https://developer.apple.com/metal/): API de gráficos e computação de baixo nível da Apple.
- [AudioKit](https://github.com/AudioKit/AudioKit): Framework para áudio e música em Swift.
- [SDL](https://github.com/kyle-powell/SwiftSDL): Bindings para Simple DirectMedia Layer.
- [ImagineEngine](https://github.com/JohnSundell/ImagineEngine): Engine 2D para jogos escrita em Swift.

---

## Resources

### Official

- [Swift.org](https://swift.org/): Site oficial da linguagem Swift.
- [Swift Documentation](https://www.swift.org/documentation/): Documentação oficial.
- [Swift Forums](https://forums.swift.org/): Comunidade oficial da linguagem.
- [Swift Package Index](https://swiftpackageindex.com/): Catálogo de pacotes Swift.

---
