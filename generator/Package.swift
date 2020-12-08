// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "generator",
    targets: [
        .target(
            name: "generator",
            dependencies: [],
            resources: [
              Resource.process("base.keylayout")
            ]),
        .testTarget(
            name: "generatorTests",
            dependencies: ["generator"]),
    ]
)
