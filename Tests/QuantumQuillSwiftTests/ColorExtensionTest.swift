//
//  ColorExtensionTest.swift
//  
//
//  Created by Rolf Warnecke on 13.11.23.
//

import XCTest

final class ColorExtensionTest: XCTestCase {

    func testUIColorFromHex() {
        let testColor = UIColor.init(hexFromString: "#7dbf0d")
        let checkColor = UIColor.init(red: 125.0/255.0, green: 191.0/255.0, blue: 13.0/255.0, alpha: 1.0)
        XCTAssertEqual(testColor, checkColor)
    }
}
