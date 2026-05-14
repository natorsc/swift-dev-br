---
title: Como criar uma API com Swift e Vapor
summary: Aprenda como criar sua primeira API REST com Swift e Vapor..
tags: Swift, Vapor, Docker
date: 2026-05-12
---
Silvia endoscopia.
O ecossistema [Swift](https://www.swift.org/) não se limita apenas ao desenvolvimento de aplicativos para iPhone, iPad e macOS.

Nos últimos anos, o desenvolvimento backend com Swift evoluiu bastante, principalmente graças ao Vapor.

O Vapor é atualmente o framework web mais popular do ecossistema Swift e permite criar:

- APIs REST.
- Microsserviços.
- Backends para aplicativos iOS.
- Serviços HTTP.
- Aplicações server-side modernas.

Tudo isso utilizando Swift puro.

Neste guia, você vai aprender como criar uma API REST completa utilizando Swift e Vapor, incluindo:

- Estrutura básica do framework.
- Criação do projeto.
- Rotas.
- Models.
- SQLite.
- CRUD completo.
- Docker.
- Deploy com NGINX.

O objetivo aqui é servir como uma introdução moderna para quem está começando com backend em Swift.

## O que é o Vapor?

O [Vapor](https://vapor.codes/) é um framework server-side escrito em Swift e baseado no SwiftNIO, a infraestrutura assíncrona criada pela Apple para aplicações de rede de alta performance.

Na prática, ele oferece:

- Servidor HTTP.
- Sistema de rotas.
- ORM.
- WebSockets.
- Middleware.
- Autenticação.
- Integração com bancos de dados.
- Suporte moderno a async/await.

Hoje o Vapor é amplamente utilizado para:

- APIs REST.
- Backends para apps iOS.
- Sistemas internos.
- Microsserviços.
- Aplicações modernas em nuvem.

## Por que usar Swift no backend?

Se você já desenvolve para Apple Platforms, usar Swift no backend traz várias vantagens:

- Mesma linguagem no frontend e backend.
- Tipagem forte.
- Excelente performance.
- Segurança de memória.
- Sintaxe moderna.
- Integração natural com modelos iOS.

Além disso, o Swift moderno possui desempenho extremamente competitivo no lado servidor.

## Instalando o Vapor Toolbox

O Vapor possui uma CLI oficial chamada Vapor Toolbox.

Ela facilita:

- Criação de projetos.
- Geração de arquivos.
- Migrations.
- Execução local.

## macOS

A forma mais simples é via Homebrew:

```bash
brew install vapor
````

## Linux

Também é possível instalar utilizando Homebrew:

```bash
brew install vapor
```

Ou manualmente:

```bash
git clone https://github.com/vapor/toolbox.git
cd toolbox
swift build -c release
sudo cp .build/release/vapor /usr/local/bin/
```

## Verificando a instalação

Depois execute:

```bash
vapor --help
```

Se o comando funcionar, a CLI está pronta.

## Criando o primeiro projeto

Agora vamos criar uma API simples chamada:

```plaintext
tasks-api
```

Execute:

```bash
vapor new tasks-api
```

Durante a criação escolha:

- Fluent: Yes.
- Database: SQLite.
- Leaf: No.

## O que o Vapor criou?

A estrutura inicial já vem organizada:

```plaintext
tasks-api/
├── Package.swift
├── Sources/
├── Tests/
├── Public/
└── Resources/
```

Os arquivos mais importantes inicialmente são:

| Arquivo           | Função                    |
| ----------------- | ------------------------- |
| `configure.swift` | Configuração da aplicação |
| `routes.swift`    | Rotas HTTP                |
| `Package.swift`   | Dependências do projeto   |

## Entrando no projeto

```bash
cd tasks-api
```

## Abrindo no editor

## VS Code

```bash
code .
```

## Xcode

```bash
open Package.swift
```

## Executando a aplicação

Para iniciar o servidor:

```bash
swift run
```

O Vapor iniciará algo parecido com:

```plaintext
Server starting on http://127.0.0.1:8080
```

Acesse:

```plaintext
http://localhost:8080
```

Se tudo estiver correto, o servidor já estará funcionando.

## Criando a model Task

Agora vamos criar nossa primeira entidade.

Arquivo:

```plaintext
Sources/App/Models/Task.swift
```

## Model completa

```swift
import Fluent
import Vapor

final class Task: Model, Content {
    static let schema = "tasks"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "title")
    var title: String

    @Field(key: "done")
    var done: Bool

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    init() {}

    init(
        id: UUID? = nil,
        title: String,
        done: Bool = false
    ) {
        self.id = id
        self.title = title
        self.done = done
    }
}
```

## O que esse model faz?

Essa estrutura:

- Cria a tabela `tasks`.
- Define os campos.
- Permite serialização JSON.
- Integra automaticamente com o Fluent ORM.

## Criando a migration

Agora precisamos criar a estrutura do banco.

## Gerando migration

```bash
vapor generate migration CreateTasks
```

Arquivo:

```plaintext
Sources/App/Migrations/CreateTasks.swift
```

## Migration completa

```swift
import Fluent

struct CreateTasks: Migration {
    func prepare(
        on database: Database
    ) -> EventLoopFuture<Void> {

        database.schema("tasks")
            .id()
            .field("title", .string, .required)
            .field("done", .bool, .required)
            .field("created_at", .datetime)
            .create()
    }

    func revert(
        on database: Database
    ) -> EventLoopFuture<Void> {

        database.schema("tasks").delete()
    }
}
```

## Registrando a migration

No arquivo:

```plaintext
Sources/App/configure.swift
```

Adicione:

```swift
app.migrations.add(CreateTasks())
```

## Executando migration

```bash
vapor run migrate
```

O SQLite será criado automaticamente.

## Criando o controller

Agora vamos criar o CRUD da API.

## Gerando controller

```bash
vapor generate controller TaskController
```

Arquivo:

```plaintext
Sources/App/Controllers/TaskController.swift
```

## Controller completo

```swift
import Vapor
import Fluent

struct TaskController: RouteCollection {

    func boot(
        routes: RoutesBuilder
    ) throws {

        let tasks = routes.grouped("tasks")

        tasks.post(use: create)
        tasks.get(use: index)
        tasks.get(":id", use: show)
        tasks.put(":id", use: update)
        tasks.delete(":id", use: delete)
    }

    func create(
        req: Request
    ) async throws -> Task {

        let task = try req.content.decode(Task.self)

        try await task.save(on: req.db)

        return task
    }

    func index(
        req: Request
    ) async throws -> [Task] {

        try await Task.query(on: req.db).all()
    }

    func show(
        req: Request
    ) async throws -> Task {

        guard let task = try await Task.find(
            req.parameters.get("id"),
            on: req.db
        ) else {
            throw Abort(.notFound)
        }

        return task
    }

    func update(
        req: Request
    ) async throws -> Task {

        let updated = try req.content.decode(Task.self)

        guard let task = try await Task.find(
            req.parameters.get("id"),
            on: req.db
        ) else {
            throw Abort(.notFound)
        }

        task.title = updated.title
        task.done = updated.done

        try await task.save(on: req.db)

        return task
    }

    func delete(
        req: Request
    ) async throws -> HTTPStatus {

        guard let task = try await Task.find(
            req.parameters.get("id"),
            on: req.db
        ) else {
            throw Abort(.notFound)
        }

        try await task.delete(on: req.db)

        return .noContent
    }
}
```

## Registrando as rotas

Arquivo:

```plaintext
Sources/App/routes.swift
```

Adicione:

```swift
func routes(_ app: Application) throws {
    try app.register(
        collection: TaskController()
    )
}
```

## Testando a API

## Criando uma task

```bash
curl -X POST http://localhost:8080/tasks \
-H "Content-Type: application/json" \
-d '{"title":"Estudar Vapor","done":false}'
```

## Listando tasks

```bash
curl http://localhost:8080/tasks
```

## Atualizando task

```bash
curl -X PUT http://localhost:8080/tasks/{id} \
-H "Content-Type: application/json" \
-d '{"title":"Atualizado","done":true}'
```

## Removendo task

```bash
curl -X DELETE http://localhost:8080/tasks/{id}
```

## Vapor precisa de NGINX?

Tecnicamente, não.

O próprio Vapor já possui servidor HTTP embutido baseado em SwiftNIO.

Você pode simplesmente executar:

```bash
swift run
```

E a aplicação já estará servindo requisições HTTP.

Mas em ambientes profissionais normalmente utilizamos um proxy reverso na frente da aplicação.

## Por que usar NGINX?

O NGINX normalmente fica responsável por:

- HTTPS.
- Certificados SSL.
- Proxy reverso.
- Compressão.
- Balanceamento de carga.
- Cache.
- Logs.
- Proteção adicional.

Na prática:

```plaintext
Internet → NGINX → Vapor
```

Esse é o modelo mais comum em produção.

## Dockerizando a aplicação

Agora vamos criar um ambiente moderno utilizando Docker.

## Dockerfile

Crie:

```plaintext
Dockerfile
```

## Conteúdo

```dockerfile
FROM swift:6.0-jammy

WORKDIR /app

COPY . .

RUN swift build -c release

EXPOSE 8080

CMD [".build/release/Run"]
```

## Build da imagem

```bash
docker build -t tasks-api .
```

## Executando container

```bash
docker run -p 8080:8080 tasks-api
```

A aplicação já estará acessível em:

```plaintext
http://localhost:8080
```

## Usando Docker Compose + NGINX

Agora vamos criar uma estrutura mais profissional.

## Estrutura

```plaintext
project/
├── docker-compose.yml
├── nginx/
│   └── default.conf
└── tasks-api/
```

## docker-compose.yml

```yaml
services:
  vapor:
    build: .
    container_name: vapor-api
    restart: always
    expose:
      - "8080"

  nginx:
    image: nginx:latest
    container_name: nginx
    restart: always
    ports:
      - "80:80"

    volumes:
      - ./nginx/default.conf:/etc/nginx/conf.d/default.conf

    depends_on:
      - vapor
```

## Configuração do NGINX

Arquivo:

```plaintext
nginx/default.conf
```

## Conteúdo

```nginx
server {
    listen 80;

    location / {
        proxy_pass http://vapor:8080;

        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
```

## Iniciando tudo

```bash
docker compose up --build
```

Agora:

```plaintext
Internet → NGINX → Vapor Container
```

## Por que Docker faz sentido com Vapor?

O Docker ajuda bastante em:

- Deploy.
- Portabilidade.
- Ambientes reproduzíveis.
- Escalabilidade.
- Kubernetes.
- Cloud.
- CI/CD.

Hoje praticamente todo ambiente backend moderno utiliza containers.

## Vapor é rápido?

Sim.

O Vapor possui excelente performance graças ao SwiftNIO.

Na prática, ele compete muito bem com:

- Node.js.
- Python FastAPI.
- Ruby on Rails.
- Alguns cenários em Go.

Além disso, o consumo de memória costuma ser bastante eficiente.

## Vale a pena aprender Vapor em 2026?

Sim, principalmente se você já trabalha com Swift.

O framework evoluiu bastante e hoje oferece:

- Excelente arquitetura.
- Async/await moderno.
- Boa performance.
- Integração natural com Swift.
- Comunidade ativa.
- Desenvolvimento muito agradável.

## Conclusão

O Vapor transformou o Swift em uma linguagem extremamente interessante também para backend.

Com poucas linhas já é possível criar:

- APIs REST.
- Serviços HTTP.
- Backends completos.
- Microsserviços modernos.

E combinado com Docker e NGINX, você já possui uma arquitetura bastante profissional para iniciar projetos reais.

Para quem já vive no ecossistema Apple, aprender Vapor é provavelmente o caminho mais natural para entrar no desenvolvimento backend utilizando Swift.
