/// Logging protocol.
public protocol Logger
{
    /// This label may appear as prefix of the message depending on the implementation.
    var label: String { get }

    /// The threshold below which messages are ignored.
    var threshold: Level { get }

    /// Actually output the log message to an external system.
    var send: (String) -> Void { get }

    /// Serialize the logged object to a string before sending it.
    func serialize<T>(_ object: T,
                      level: Level,
                      file: String,
                      function: String,
                      line: UInt) -> String
    
    /// Serialize the logged object to a string before sending it.
    func serialize<T>(_ string: String,
                      _ object: T,
                      level: Level,
                      file: String,
                      function: String,
                      line: UInt) -> String

    /// Verbose messages intended for debugging or tracing code execution.
    func trace<T>(_ object: @autoclosure @escaping () -> T,
                  file: String,
                  function: String,
                  line: UInt)

    /// Messages intended for debugging or tracing code execution.
    func debug<T>(_ string: @autoclosure @escaping () -> String,
                  _ object: @autoclosure @escaping () -> T,
                  file: String,
                  function: String,
                  line: UInt)
    
    /// Messages intended for debugging or tracing code execution.
    func debug<T>(_ object: @autoclosure @escaping () -> T,
                  file: String,
                  function: String,
                  line: UInt)

    /// Messages providing general information.
    func info<T>(_ object: @autoclosure @escaping () -> T,
                 file: String,
                 function: String,
                 line: UInt)
    
    /// Messages providing general information.
    func info<T>(_ string: @autoclosure @escaping () -> String,
                 _ object: @autoclosure @escaping () -> T,
                 file: String,
                 function: String,
                 line: UInt)

    /// Messages indicating potential issues or non critical errors.
    func warn<T>(_ object: @autoclosure @escaping () -> T,
                 file: String,
                 function: String,
                 line: UInt)
    
    /// Messages indicating potential issues or non critical errors.
    func warn<T>(_ string: @autoclosure @escaping () -> String,
                 _ object: @autoclosure @escaping () -> T,
                 file: String,
                 function: String,
                 line: UInt)

    /// Messages indicating a malfunction that requires developer attention.
    func error<T>(_ object: @autoclosure @escaping () -> T,
                  file: String,
                  function: String,
                  line: UInt)
    
    /// Messages indicating a malfunction that requires developer attention.
    func error<T>(_ string: @autoclosure @escaping () -> String,
                  _ object: @autoclosure @escaping () -> T,
                  file: String,
                  function: String,
                  line: UInt)
}
