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
    
    func testDebug_object() {
        let send = { message in
            XCTAssertEqual(
                message,
                """
                [dump] DumpLoggerTests.testDebug_object…: 18 · Foo [
                  "a": "b",
                  "c": "d"
                ]
                """
            )
        }
        DumpLogger(label: "dump", send: send).debug("Foo", ["a": "b", "c": "d"], line: 18)
    }

    func testSerialization_debugObject() {
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
    
    func testSerialization_debugStringObject() {
        let logger = DumpLogger(label: "dump", send: { _ in })
        let string = logger.serialize("Foo", ["a": "b", "c": "d"], level: .debug, line: 23)
        XCTAssertEqual(
            string,
            """
            [dump] DumpLoggerTests.testSerializatio…: 23 · Foo [
              "a": "b",
              "c": "d"
            ]
            """
        )
    }
}
