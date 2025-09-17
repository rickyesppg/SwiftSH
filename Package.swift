// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SwiftSH",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "SwiftSH", targets: ["SwiftSH"])
    ],
    dependencies: [
        // 锁定到存在的预发布 tag（不含 arm64e）
        .package(url: "https://github.com/DimaRU/Libssh2Prebuild.git",
                 exact: "1.11.0-OpenSSL-1-1-1w")
    ],
    targets: [
        .target(
            name: "SwiftSH",
            dependencies: [
                .product(name: "CSSH", package: "Libssh2Prebuild")
            ],
            path: "SwiftSH",
            exclude: [
                "SwiftSH Example", "SwiftSH Example.xcodeproj",
                "SwiftSH.xcodeproj", "SwiftSH.xcworkspace",
                "SwiftSH Integration Tests", ".travis", ".travis.yml",
                "libssh2", "Dockerfile", "SwiftSH.podspec", "Frameworks"
            ],
            linkerSettings: [
                .linkedLibrary("z")
            ]
        )
    ]
)