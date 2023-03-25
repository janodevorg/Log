@testable import Logger
import XCTest

final class SerializerTests: XCTestCase
{
    func testSerializer() {
        let label = "tests"
        let message = "hello"
        let line: UInt = 10
        let string = Serializer(
            label: label,
            level: Level.debug.icon(),
            message: message,
            file: #file,
            function: #function,
            line: line
        ).serialize()
        XCTAssert(string.contains("[\(label)]"))        // [tests]
        XCTAssert(string.contains("\(type(of: self))")) // SerializerTests
        XCTAssert(string.contains("\(#function)"))      // testSerializer()
        XCTAssert(string.contains("\(line)"))           // 10
        XCTAssert(string.contains(message))             // hello
    }
}
