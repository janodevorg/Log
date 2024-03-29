import Foundation
import CustomDump
import Logger

/**
 Concrete logging implementation that uses reflection to pretty print object descriptions.

 Usage:
 ```
 let log = DumpLogger(label: "example", logLevel: .trace)
 log.debug("something is up")
 ```
 */
public final class DumpLogger: PrintLogger {
    override public func dump<T>(_ object: T) -> String {
        var message = ""
        customDump(object, to: &message)
        // trim quotes added by customDump
        if message.hasPrefix("\"") && message.hasSuffix("\"") {
            message.removeFirst()
            message.removeLast()
        }
        return message
    }
}
