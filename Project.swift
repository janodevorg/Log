import ProjectDescription

let project = Project(
    name: "Log",
    packages: [
        .package(url: "git@github.com:SimplyDanny/SwiftLintPlugins.git", from: "0.59.1"),
        .package(url: "git@github.com:apple/swift-docc-plugin.git", from: "1.4.3"),
        .package(url: "git@github.com:pointfreeco/swift-custom-dump.git", from: "0.9.1")
    ],
    settings: .settings(base: [
        "SWIFT_VERSION": "6.0",
        "IPHONEOS_DEPLOYMENT_TARGET": "18.0",
        "MACOSX_DEPLOYMENT_TARGET": "15.0",
        "ENABLE_MODULE_VERIFIER": "YES"
    ]),
    targets: [
        .target(
            name: "Logger",
            destinations: [.iPhone, .mac],
            product: .framework,
            bundleId: "dev.jano.log.logger",
            sources: ["Sources/Main/logger/**"],
            scripts: [
                swiftlintScript()
            ]
        ),
        .target(
            name: "DumpLogger",
            destinations: [.iPhone, .mac],
            product: .framework,
            bundleId: "dev.jano.log.dumplogger",
            sources: ["Sources/Main/dumpLogger/**"],
            scripts: [
                swiftlintScript()
            ],
            dependencies: [
                .target(name: "Logger"),
                .package(product: "CustomDump", type: .runtime)
            ]
        ),
        .target(
            name: "LogTests",
            destinations: [.iPhone, .mac],
            product: .unitTests,
            bundleId: "dev.jano.log.test",
            sources: ["Sources/Tests/**"],
            dependencies: [
                .target(name: "Logger"),
                .target(name: "DumpLogger")
            ]
        )
    ],
    schemes: [
       Scheme.scheme(
           name: "Log",
           shared: true,
           buildAction: BuildAction.buildAction(
               targets: [
                   TargetReference.target("Logger"),
                   TargetReference.target("DumpLogger")
               ]
           ),
           testAction: .targets(
               [TestableTarget.testableTarget(target: TargetReference.target("LogTests"))],
               configuration: .debug,
               attachDebugger: true
           )
       )
    ]
)

func swiftlintScript() -> ProjectDescription.TargetScript {
    let script = """
    #!/bin/sh

    # Check swiftlint
    command -v /opt/homebrew/bin/swiftlint >/dev/null 2>&1 || { echo >&2 "swiftlint not found at /opt/homebrew/bin/swiftlint. Aborting."; exit 1; }

    # Create a temp file
    temp_file=$(mktemp)

    # Gather all modified and staged files within the Sources directory
    git ls-files -m Sources | grep ".swift$" > "${temp_file}"
    git diff --name-only --cached Sources | grep ".swift$" >> "${temp_file}"

    # Make list of unique and sorted files
    counter=0
    for f in $(sort "${temp_file}" | uniq)
    do
        eval "export SCRIPT_INPUT_FILE_$counter=$f"
        counter=$(expr $counter + 1)
    done

    # Lint
    if [ $counter -gt 0 ]; then
        export SCRIPT_INPUT_FILE_COUNT=${counter}
        /opt/homebrew/bin/swiftlint autocorrect --use-script-input-files
    fi
    """
    return .post(script: script, name: "Swiftlint", basedOnDependencyAnalysis: false, runForInstallBuildsOnly: false, shellPath: "/bin/zsh")
}