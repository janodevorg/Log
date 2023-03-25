@testable import Logger
import XCTest

final class PrintLoggerTests: XCTestCase
{
    func testTrace() {
        let log = PrintLogger(label: "tests", threshold: .debug)
        log.trace("\(XCTFail("When log threshold is above 'trace' log message shouldn’t resolve."))")
    }
    
    func testDebug() {
        let log = PrintLogger(label: "tests", threshold: .info)
        log.debug("\(XCTFail("When log threshold is above 'debug' log message shouldn’t resolve."))")
    }

    func testInfo() {
        let log = PrintLogger(label: "tests", threshold: .warn)
        log.info("\(XCTFail("When log threshold is above 'info' log message shouldn’t resolve."))")
    }

    func testError() {
        let log = PrintLogger(label: "tests", threshold: .none)
        log.error("\(XCTFail("When log threshold is above 'error' log message shouldn’t resolve."))")
    }
}
