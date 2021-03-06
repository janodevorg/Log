// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "Log",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "Log", type: .dynamic, targets: ["Log"]),
        .library(name: "LogStatic", type: .static, targets: ["Log"])
    ],
    dependencies: [
        .package(url: "git@github.com:apple/swift-docc-plugin.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "Log",
            dependencies: [
            ],
            path: "sources/main"
        ),
        .testTarget(
            name: "LogTests",
            dependencies: ["Log"],
            path: "sources/tests"
        )
    ]
)
