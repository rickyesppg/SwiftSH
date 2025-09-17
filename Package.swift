// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SwiftSH",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "SwiftSH", targets: ["SwiftSH"])
    ],
    dependencies: [
        .package(url: "https://github.com/DimaRU/Libssh2Prebuild.git",
                 exact: "1.11.0-OpenSSL-1-1-1w")
    ],
    targets: [
        // C/ObjC 目标：只能放 C 家族源码
        .target(
            name: "SwiftSHObjC",
            path: "Sources/SwiftSHObjC",
            publicHeadersPath: "include"
        ),
        // Swift 目标：依赖 C 目标 + CSSH
        .target(
            name: "SwiftSH",
            dependencies: [
                "SwiftSHObjC",
                .product(name: "CSSH", package: "Libssh2Prebuild")
            ],
            path: "Sources/SwiftSH",
            linkerSettings: [.linkedLibrary("z")]
        )
    ]
)