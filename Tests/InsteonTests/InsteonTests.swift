import XCTest
@testable import Insteon

class InsteonTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Insteon().text, "Hello, World!")
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
