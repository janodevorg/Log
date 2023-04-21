/// Partial implementation that ignores logging calls when compiled for release.
/// Look at PrintLogger for an example of a concrete implementation.
public extension Logger {
    private func log<T>(_ object: @escaping () -> T,
                        level: Level,
                        file: String,
                        function: String,
                        line: UInt) {
        guard level >= threshold  else { return }
        send(serialize(object(), level: level, file: file, function: function, line: line))
    }
    
    private func log<T>(_ string: @escaping () -> String,
                        _ object: @escaping () -> T,
                        level: Level,
                        file: String,
                        function: String,
                        line: UInt) {
        guard level >= threshold  else { return }
        send(serialize(string(), object(), level: level, file: file, function: function, line: line))
    }

    func trace<T>(_ object: @autoclosure @escaping () -> T,
                  file: String = #fileID,
                  function: String = #function,
                  line: UInt = #line) {
        #if DEBUG
        log(object, level: .trace, file: file, function: function, line: line)
        #endif
    }
    
    func trace<T>(_ string: @escaping () -> String,
                  _ object: @autoclosure @escaping () -> T,
                  file: String = #fileID,
                  function: String = #function,
                  line: UInt = #line) {
        #if DEBUG
        log(string, object, level: .trace, file: file, function: function, line: line)
        #endif
    }

    func debug<T>(_ object: @autoclosure @escaping () -> T,
                  file: String = #fileID,
                  function: String = #function,
                  line: UInt = #line) {
        #if DEBUG
        log(object, level: .debug, file: file, function: function, line: line)
        #endif
    }
    
    func debug<T>(_ string: @autoclosure @escaping () -> String,
                  _ object: @autoclosure @escaping () -> T,
                  file: String,
                  function: String,
                  line: UInt) {
        #if DEBUG
        log(string, object, level: .debug, file: file, function: function, line: line)
        #endif
    }

    func info<T>(_ object: @autoclosure @escaping () -> T,
                 file: String = #fileID,
                 function: String = #function,
                 line: UInt = #line) {
        #if DEBUG
        log(object, level: .info, file: file, function: function, line: line)
        #endif
    }
    
    func info<T>(_ string: @escaping () -> String,
                 _ object: @autoclosure @escaping () -> T,
                 file: String = #fileID,
                 function: String = #function,
                 line: UInt = #line) {
        #if DEBUG
        log(string, object, level: .info, file: file, function: function, line: line)
        #endif
    }
    
    func warn<T>(_ object: @autoclosure @escaping () -> T,
                 file: String = #fileID,
                 function: String = #function,
                 line: UInt = #line) {
        #if DEBUG
        log(object, level: .warn, file: file, function: function, line: line)
        #endif
    }

    func warn<T>(_ string: @escaping () -> String,
                 _ object: @autoclosure @escaping () -> T,
                 file: String = #fileID,
                 function: String = #function,
                 line: UInt = #line) {
        #if DEBUG
        log(string, object, level: .warn, file: file, function: function, line: line)
        #endif
    }

    func error<T>(_ object: @autoclosure @escaping () -> T,
                  file: String = #fileID,
                  function: String = #function,
                  line: UInt = #line) {
        #if DEBUG
        log(object, level: .error, file: file, function: function, line: line)
        #endif
    }
    
    func error<T>(_ string: @escaping () -> String,
                  _ object: @autoclosure @escaping () -> T,
                  file: String = #fileID,
                  function: String = #function,
                  line: UInt = #line) {
        #if DEBUG
        log(string, object, level: .error, file: file, function: function, line: line)
        #endif
    }
}
