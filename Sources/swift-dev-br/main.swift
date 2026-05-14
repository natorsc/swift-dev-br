import Foundation
import Saga
import SagaParsleyMarkdownReader
import SagaSwimRenderer

struct ArticleMetadata: Metadata {
    let tags: [String]
    var summary: String?
}

try await Saga(input: "content", output: "deploy")
    .register(
        folder: "articles",
        metadata: ArticleMetadata.self,
        readers: [.parsleyMarkdownReader],
        writers: [
            .itemWriter(swim(renderArticle)),
            .listWriter(swim(renderArticles)),
            .tagWriter(swim(renderTag), tags: \.metadata.tags),
        ]
    )
    .register(
        metadata: EmptyMetadata.self,
        readers: [.parsleyMarkdownReader],
        writers: [.itemWriter(swim(renderPage))]
    )
    .createPage(
        "sitemap.xml",
        using: Saga.sitemap(baseURL: URL(string: "https://swift.dev.br")!),
    )
    .run()
