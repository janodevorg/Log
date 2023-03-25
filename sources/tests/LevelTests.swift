@testable import Logger
import XCTest

final class LevelTests: XCTestCase
{
    func testComparable() {
        XCTAssert(Level.trace < Level.debug)
        XCTAssert(Level.debug < Level.info)
        XCTAssert(Level.warn < Level.error)
        XCTAssert(Level.error < Level.none)
    }

    func testEquality() {
        XCTAssert(Level.trace == Level.trace)
        XCTAssert(Level.debug == Level.debug)
        XCTAssert(Level.info == Level.info)
        XCTAssert(Level.warn == Level.warn)
        XCTAssert(Level.error == Level.error)
        XCTAssert(Level.none == Level.none)
    }
}
