// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "Log",
    platforms: [
        .iOS(.v13), 
        .macCatalyst(.v13), 
        .macOS(.v12),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(name: "Logger", targets: ["Logger"]),
        .library(name: "LoggerDynamic", type: .dynamic, targets: ["Logger"]),
        .library(name: "DumpLogger", targets: ["DumpLogger"]),
        .library(name: "DumpLoggerDynamic", type: .dynamic, targets: ["DumpLogger"]),
    ],
    dependencies: [
        .package(url: "git@github.com:apple/swift-docc-plugin.git", from: "1.0.0"),
        .package(url: "git@github.com:pointfreeco/swift-custom-dump.git", from: "0.9.1")
    ],
    targets: [
        .target(
            name: "Logger",
            path: "sources/main/logger"
        ),
        .target(
            name: "DumpLogger",
            dependencies: [
                "Logger",
                .product(name: "CustomDump", package: "swift-custom-dump")
            ],
            path: "sources/main/dumpLogger"
        ),
        .testTarget(
            name: "LoggerTests",
            dependencies: [
                "Logger",
                "DumpLogger"
            ],
            path: "sources/tests"
        )
    ]
)
