//
//  ValidatorTests.swift
//  OnenexCodingTestTests
//
//  Created by Win Htun Oo on 30/06/2023.
//

import XCTest
@testable import OnenexCodingTest

final class ValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidator_checkNRC_returnPassed() {
        let id = "123456"
        let msg = Validator.nrcCheck(id: id)
        XCTAssertTrue(msg.passed)
        XCTAssertEqual(msg.reason, "NRC Check Passed.")
    }
    
    func testValidator_checkNRC_returnNotPassedBezFieldEmpty() {
        let id = ""
        let msg = Validator.nrcCheck(id: id)
        XCTAssertFalse(msg.passed)
        XCTAssertEqual(msg.reason, "ID must not be empty.")
    }
    
    func testValidator_checkNRC_returnNotPassedBezIDIsntNumber() {
        let id = "001a11"
        let msg = Validator.nrcCheck(id: id)
        XCTAssertFalse(msg.passed)
        XCTAssertEqual(msg.reason, "Your ID must be number.")
    }
    
    func testValidator_checkNRC_returnNotPassedBezOfWrongNoOfDigitsInID() {
        let id = "0111"
        let msg = Validator.nrcCheck(id: id)
        XCTAssertFalse(msg.passed)
        XCTAssertEqual(msg.reason, "ID must be 6 digits.")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
