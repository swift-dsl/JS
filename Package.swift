// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "JS",
    platforms: [
        .macOS(.v13),
    ],
    products: [
        .library(
            name: "JS",
            targets: [
                "JS",
            ]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-dsl/DSL.git",
            branch: "master"
        ),
    ],
    targets: [
        .target(
            name: "JS",
            dependencies: [
                .product(
                    name: "DSL",
                    package: "DSL"
                ),
            ]
        ),
    ]
)
