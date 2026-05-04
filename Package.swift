// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "swift-dev-br",
    platforms: [
        .macOS(.v14)
    ],
    dependencies: [
        .package(url: "https://github.com/loopwerk/Saga", from: "3.4.0"),
        .package(url: "https://github.com/loopwerk/SagaParsleyMarkdownReader", from: "1.3.0"),
        .package(url: "https://github.com/loopwerk/SagaSwimRenderer", from: "1.4.1"),
        .package(url: "https://github.com/loopwerk/Moon", from: "1.3.0"),
    ],
    targets: [
        .executableTarget(
            name: "swift-dev-br",
            dependencies: [
                "Saga",
                "SagaParsleyMarkdownReader",
                "SagaSwimRenderer",
                "Moon",
            ]
        )
    ]
)
