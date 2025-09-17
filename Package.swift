// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SwiftSH",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(name: "SwiftSH", targets: ["SwiftSH"]) 
    ],
    dependencies: [
        // Use an exact **pre‑release** tag that actually exists in Libssh2Prebuild
        // ("from: 1.9.0" 会忽略预发布标签，导致解析不到版本)
        .package(url: "https://github.com/DimaRU/Libssh2Prebuild.git", exact: "1.11.0-OpenSSL-1-1-1w")
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
                "libssh2", "Dockerfile", "SwiftSH.podspec"
            ],
            linkerSettings: [
                .linkedLibrary("z")
            ]
        )
    ]
)