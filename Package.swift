// swift-tools-version:6.1
import PackageDescription

let package = Package(
    name: "Log",
    platforms: [
        .iOS(.v18), 
        .macCatalyst(.v18), 
        .macOS(.v15),
        .tvOS(.v18),
        .watchOS(.v11)
    ],
    products: [
        .library(name: "Logger", targets: ["Logger"]),
        .library(name: "DumpLogger", targets: ["DumpLogger"]),
    ],
    dependencies: [
        .package(url: "git@github.com:apple/swift-docc-plugin.git", from: "1.4.3"),
        .package(url: "git@github.com:pointfreeco/swift-custom-dump.git", from: "0.9.1")
    ],
    targets: [
        .target(
            name: "Logger",
            path: "Sources/Main/logger"
        ),
        .target(
            name: "DumpLogger",
            dependencies: [
                "Logger",
                .product(name: "CustomDump", package: "swift-custom-dump")
            ],
            path: "Sources/Main/dumpLogger"
        ),
        .testTarget(
            name: "LoggerTests",
            dependencies: [
                "Logger",
                "DumpLogger"
            ],
            path: "Sources/Tests"
        )
    ]
)
