import XCTest
@testable import SSUtils

final class DecimalExtensionsTests: XCTestCase {

    func testToInt() throws {
        let decimalValue: Decimal = 2.05
        XCTAssertEqual(2, decimalValue.toInt())
    }

    func testIsInteger() throws {
        let integerValue: Decimal = 2.00
        let notIntegerValue: Decimal = 2.001
        XCTAssert(integerValue.isInteger)
        XCTAssertFalse(notIntegerValue.isInteger)
    }
}
