@testable import DumpLogger
import XCTest

final class DumpLoggerTests: XCTestCase
{
    func testDebug() {
        let send = { message in
            XCTAssertEqual(
                message,
                """
                [dump]       DumpLoggerTests.testDebug(): 18 · [
                  "a": "b",
                  "c": "d"
                ]
                """
            )
        }
        DumpLogger(label: "dump", send: send).debug(["a": "b", "c": "d"], line: 18)
    }

    func testSerialization() {
        let logger = DumpLogger(label: "dump", send: { _ in })
        let string = logger.serialize(["a": "b", "c": "d"], level: .debug, line: 23)
        XCTAssertEqual(
            string,
            """
            [dump] DumpLoggerTests.testSerializatio…: 23 · [
              "a": "b",
              "c": "d"
            ]
            """
        )
    }
}
