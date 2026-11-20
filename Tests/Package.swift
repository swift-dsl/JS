// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "JSTests",
    platforms: [
        .macOS(.v13),
    ],
    products: [
        .executable(
            name: "jstest",
            targets: [
                "JSTestFlows",
            ]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/leviouwendijk/DSL.git",
            branch: "master"
        ),
        .package(
            url: "https://github.com/leviouwendijk/TestFlows.git",
            branch: "master"
        ),
        .package(path: ".."),
    ],
    targets: [
        .executableTarget(
            name: "JSTestFlows",
            dependencies: [
                .product(name: "JS", package: "JS"),
                .product(
                    name: "DSL",
                    package: "DSL"
                ),
                .product(
                    name: "TestFlows",
                    package: "TestFlows"
                ),
            ]
        ),
    ]
)
