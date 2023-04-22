set -o pipefail && xcodebuild test -scheme "Log-Package" -destination "OS=16.4,name=iPhone 14 Pro" -skipPackagePluginValidation | xcbeautify
set -o pipefail && xcodebuild test -scheme "Log-Package" -destination "platform=macOS,arch=arm64" -skipPackagePluginValidation | xcbeautify
set -o pipefail && xcodebuild test -scheme "Log-Package" -destination "platform=macOS,arch=arm64,variant=Mac Catalyst" -skipPackagePluginValidation | xcbeautify
set -o pipefail && xcodebuild test -scheme "Log-Package" -destination "platform=tvOS Simulator,name=Apple TV 4K (3rd generation)" -skipPackagePluginValidation | xcbeautify
set -o pipefail && xcodebuild test -scheme "Log-Package" -destination "platform=watchOS Simulator,name=Apple Watch Ultra (49mm)" -skipPackagePluginValidation | xcbeautify
