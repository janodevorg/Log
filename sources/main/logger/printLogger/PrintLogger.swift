import Foundation

/**
 Concrete logging implementation.

 Usage:
 ```
 let log = PrintLogger(label: "example", logLevel: .trace)
 log.debug("something is up")
 ```
 */
open class PrintLogger: ObservableObject, Logger
{    
    // MARK: - Initializer

    public let label: String
    public let threshold: Level
    public let send: (String) -> Void

    /// - Parameters:
    ///   - label: Tag for each log line. Usually the module name.
    ///   - threshold: logs below this level are ignored.
    ///   - send: Function the log is sent to. It defaults to `print($0)`.
    public init(label: String,
                threshold: Level = .debug,
                send: @escaping (String) -> Void = { print($0) })
    {
        self.label = label
        self.threshold = threshold
        self.send = send
    }

    /// Transforms non String objects to string using "\(object)".
    public func serialize<T>(_ object: T,
                             level: Level,
                             file: String = #fileID,
                             function: String = #function,
                             line: UInt = #line) -> String {
        Serializer(
            label: label,
            level: level.icon(),
            message: dump(object),
            file: file,
            function: function,
            line: line
        ).serialize()
    }
    
    public func serialize<T>(_ message: String,
                             _ object: T,
                             level: Level,
                             file: String = #fileID,
                             function: String = #function,
                             line: UInt = #line) -> String {
        Serializer(
            label: label,
            level: level.icon(),
            message: message + " " + dump(object),
            file: file,
            function: function,
            line: line
        ).serialize()
    }

    open func dump<T>(_ object: T) -> String {
        "\(object)"
    }
}
