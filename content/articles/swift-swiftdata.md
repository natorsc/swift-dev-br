---
title: Persistência de dados com SwiftData
summary: Guia moderno de banco de dados na linguagem de programação Swift.
tags: Swift, SwiftData, SwiftUI
date: 2026-05-11
---

Persistência de dados sempre foi uma das partes mais importantes do desenvolvimento de aplicativos. Afinal, praticamente toda aplicação precisa armazenar informações em algum momento:

- Usuários.
- Configurações.
- Tarefas.
- Mensagens.
- Cache local.
- Histórico.
- Dados offline.

Durante muitos anos, a principal solução da Apple para isso foi o Core Data.

Embora extremamente poderoso, o Core Data sempre carregou uma reputação de framework complexo, verboso e pouco amigável para iniciantes.

Com a chegada do SwiftData, a Apple finalmente modernizou completamente a experiência de persistência no ecossistema Swift.

Agora é possível trabalhar com banco de dados utilizando:

- Swift puro.
- Sintaxe moderna.
- Macros.
- Integração nativa com SwiftUI.
- Concurrency moderna.
- Muito menos boilerplate.

Neste guia completo, você vai aprender:

- O que é SwiftData.
- Por que ele existe.
- Como criar models.
- Como salvar dados.
- Como fazer consultas.
- Como trabalhar com relacionamentos.
- Integração com SwiftUI.
- SwiftData vs Core Data.
- Boas práticas modernas.
- Limitações atuais.

## O que é SwiftData?

O SwiftData é o framework moderno da Apple para persistência de dados local.

Ele foi apresentado como uma evolução natural do Core Data, mas com uma abordagem muito mais alinhada ao Swift moderno.

Com SwiftData, você consegue:

- Salvar objetos.
- Buscar registros.
- Atualizar dados.
- Criar relacionamentos.
- Persistir informações localmente.

Tudo isso utilizando código Swift comum.

Sem:

- Arquivos `.xcdatamodeld`.
- `NSManagedObject`.
- XMLs complexos.
- Grande quantidade de configuração manual.

## Por que o SwiftData foi criado?

Durante anos, muitos desenvolvedores consideravam o Core Data poderoso, mas excessivamente complicado.

Mesmo tarefas simples normalmente exigiam:

- Configuração extensa.
- Arquivos externos.
- APIs antigas herdadas do Objective-C.
- Boilerplate repetitivo.

Exemplo clássico no Core Data:

- Criar modelo.
- Configurar entidade.
- Gerar classes.
- Configurar contexto.
- Fazer fetch manual.
- Salvar contexto.

No SwiftData, boa parte disso desapareceu.

A ideia do framework é:

> Persistência moderna usando Swift moderno.

## Como o SwiftData funciona?

O SwiftData utiliza:

- Macros Swift.
- Reflection.
- Integração automática com SwiftUI.
- Inferência de esquema.
- Persistência automática.

Na prática, você transforma uma classe Swift normal em uma entidade persistente utilizando apenas:

```swift
@Model
````

## Criando o primeiro model no SwiftData

Aqui está um exemplo simples:

```swift
import SwiftData

@Model
class Usuario {
    var nome: String
    var idade: Int

    init(nome: String, idade: Int) {
        self.nome = nome
        self.idade = idade
    }
}
```

Isso já define automaticamente:

- Estrutura persistente.
- Schema do banco.
- Propriedades observáveis.
- Integração com SwiftUI.

Sem arquivos externos.

Sem geração de código.

Sem configuração complicada.

## O que a macro `@Model` faz?

A macro `@Model` transforma a classe em uma entidade persistente do SwiftData.

Ela adiciona automaticamente:

- Rastreamento de mudanças.
- Persistência.
- Integração com queries.
- Observabilidade.
- Gerenciamento interno de dados.

É uma das partes mais elegantes do framework.

## Configurando o container

Para utilizar SwiftData no aplicativo, é necessário configurar o `ModelContainer`.

No SwiftUI:

```swift
import SwiftUI
import SwiftData

@main
struct MeuApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Usuario.self)
    }
}
```

Esse comando cria automaticamente:

- Banco local.
- Contexto.
- Estrutura persistente.
- Gerenciamento de entidades.

## O que é o `ModelContainer`?

O `ModelContainer` funciona como o núcleo do SwiftData.

Ele gerencia:

- Entidades persistidas.
- Contextos.
- Armazenamento.
- Queries.
- Relacionamentos.

Pense nele como o equivalente moderno do `NSPersistentContainer` do Core Data.

## Inserindo dados no SwiftData

Depois da configuração, inserir dados é extremamente simples.

## Obtendo o contexto

```swift
@Environment(\.modelContext)
private var context
```

## Inserindo um objeto

```swift
func adicionarUsuario() {
    let usuario = Usuario(
        nome: "Ana",
        idade: 25
    )

    context.insert(usuario)
}
```

E pronto.

O SwiftData já cuida da persistência automaticamente.

## Persistência automática

Uma das maiores diferenças em relação ao Core Data é que normalmente você não precisa chamar:

```swift
save()
```

O SwiftData gerencia isso automaticamente na maioria dos cenários.

Isso reduz bastante o boilerplate.

## Buscando dados com `@Query`

O SwiftData possui integração nativa com SwiftUI através do `@Query`.

Exemplo:

```swift
@Query
var usuarios: [Usuario]
```

Isso já busca automaticamente todos os registros.

## Queries com filtros

Também é possível filtrar:

```swift
@Query(
    filter: #Predicate<Usuario> {
        $0.idade >= 18
    }
)
var adultos: [Usuario]
```

Essa integração entre SwiftData e SwiftUI é uma das partes mais impressionantes do framework.

## Atualizando dados

Atualizar objetos é extremamente simples.

Basta alterar a propriedade:

```swift
usuario.nome = "Novo Nome"
```

O SwiftData detecta automaticamente a mudança.

Não é necessário:

- Atualizar manualmente.
- Sincronizar contexto.
- Salvar explicitamente em muitos casos.

## Removendo dados

Para deletar:

```swift
context.delete(usuario)
```

Simples assim.

## Trabalhando com relacionamentos

SwiftData suporta relacionamentos de forma extremamente natural.

## Exemplo de relacionamento

```swift
@Model
class Usuario {
    var nome: String
    var posts: [Post] = []

    init(nome: String) {
        self.nome = nome
    }
}

@Model
class Post {
    var titulo: String
    var autor: Usuario

    init(titulo: String, autor: Usuario) {
        self.titulo = titulo
        self.autor = autor
    }
}
```

Sem configuração manual complexa.

Sem relacionamentos definidos em interfaces gráficas.

Tudo acontece com tipos Swift normais.

## SwiftData + SwiftUI: combinação perfeita

O SwiftData foi claramente criado pensando em SwiftUI.

A integração é extremamente fluida.

## Exemplo completo

```swift
import SwiftUI
import SwiftData

@Model
class Task {
    var titulo: String
    var concluida: Bool

    init(titulo: String) {
        self.titulo = titulo
        self.concluida = false
    }
}

struct ContentView: View {
    @Query var tasks: [Task]

    @Environment(\.modelContext)
    private var context

    var body: some View {
        NavigationStack {
            List(tasks) { task in
                HStack {
                    Image(
                        systemName: task.concluida
                        ? "checkmark.circle.fill"
                        : "circle"
                    )

                    Text(task.titulo)
                }
            }
            .navigationTitle("Tarefas")
            .toolbar {
                Button("Adicionar") {
                    context.insert(
                        Task(titulo: "Estudar SwiftData")
                    )
                }
            }
        }
    }
}
```

Esse nível de simplicidade era muito difícil de alcançar com Core Data tradicional.

## SwiftData e Swift Concurrency

O SwiftData também possui excelente integração com Swift Concurrency.

Exemplo:

```swift
@MainActor
func criarUsuario(
    context: ModelContext
) {
    context.insert(
        Usuario(
            nome: "Carlos",
            idade: 30
        )
    )
}
```

Isso ajuda bastante na segurança de concorrência.

## SwiftData vs Core Data

Essa é uma comparação inevitável.

| SwiftData                     | Core Data                  |
| ----------------------------- | -------------------------- |
| Swift moderno                 | APIs legadas               |
| Simples                       | Complexo                   |
| `@Model`                      | `NSManagedObject`          |
| Código puro                   | Arquivos externos          |
| Menos boilerplate             | Muito boilerplate          |
| Integração nativa com SwiftUI | Integração manual          |
| Mais amigável                 | Curva de aprendizado maior |

## Então o Core Data morreu?

Não exatamente.

Internamente, o SwiftData ainda utiliza partes da infraestrutura do Core Data.

Além disso, o Core Data continua relevante em:

- Sistemas antigos.
- Projetos legados.
- Bancos extremamente complexos.
- Aplicações enterprise.

Mas para novos projetos SwiftUI modernos, o SwiftData tende a se tornar o padrão.

## Boas práticas com SwiftData

Algumas práticas ajudam bastante em projetos reais.

## Mantenha models simples

Evite lógica pesada dentro dos models.

## Use camadas de serviço

Projetos maiores se beneficiam de:

- Repositories.
- Services.
- Managers.

## Evite queries excessivamente complexas

Filtros simples normalmente possuem melhor performance.

## Use `@MainActor` quando necessário

Principalmente em integração com interface.

## Modele corretamente os relacionamentos

Evite estruturas muito profundas desnecessariamente.

## Erros comuns de iniciantes

## 1. Esquecer o `.modelContainer`

Sem isso o SwiftData não funciona.

## 2. Colocar lógica demais no model

Mantenha as entidades focadas em dados.

## 3. Ignorar performance

Mesmo com abstração moderna, persistência ainda possui custo.

## 4. Abusar de queries automáticas

Em listas muito grandes, isso pode impactar desempenho.

## Quando vale a pena usar SwiftData?

O SwiftData é excelente para:

- Apps SwiftUI modernos.
- Aplicações iOS recentes.
- Apps macOS.
- Aplicações offline.
- Projetos novos.
- Desenvolvimento rápido.

## Quando talvez não seja ideal?

Alguns cenários ainda podem exigir alternativas:

- Compatibilidade com iOS muito antigo.
- Bancos extremamente complexos.
- Migrações avançadas.
- Necessidade de controle muito específico.

## O futuro da persistência no ecossistema Apple

Tudo indica que SwiftData será o futuro da persistência de dados no ecossistema Apple.

Ele representa exatamente a direção moderna da plataforma:

- Swift-first.
- Integração com macros.
- Menos boilerplate.
- APIs declarativas.
- Melhor experiência para desenvolvedores.

Principalmente combinado com SwiftUI, o framework oferece uma experiência extremamente produtiva.

## Conclusão

O SwiftData modernizou completamente a persistência de dados no ecossistema Apple.

O que antes exigia:

- Configuração extensa.
- APIs complexas.
- Arquivos externos.
- Muito boilerplate.

Agora pode ser feito com poucas linhas de Swift puro.

Para quem está começando hoje com desenvolvimento Apple, aprender SwiftData provavelmente faz muito mais sentido do que começar diretamente pelo Core Data tradicional.

E para quem já sofreu com Core Data no passado, o SwiftData representa exatamente o que muitos desenvolvedores esperavam há anos: persistência moderna com Swift moderno.
