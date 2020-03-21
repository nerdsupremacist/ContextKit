// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ContextKit",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        .library(name: "ContextKit",
                 targets: ["ContextKit"]),
    ],
    targets: [
        .target(
            name: "ContextKit"
        ),
    ]
)
