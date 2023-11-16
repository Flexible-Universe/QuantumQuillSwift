//
//  BoolExtensionTest.swift
//  
//
//  Created by Rolf Warnecke on 16.11.23.
//

import XCTest

final class BoolExtensionTest: XCTestCase {
    
    func testBoolToIntTrue() throws {
        let testInt = true.toInt()
        XCTAssertEqual(1, testInt)
    }
    
    func testBoolToIntFalse() throws {
        let testInt = false.toInt()
        XCTAssertEqual(0, testInt)
    }
}
