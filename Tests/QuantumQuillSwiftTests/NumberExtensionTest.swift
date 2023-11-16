//
//  NumberExtensionTest.swift
//  
//
//  Created by Rolf Warnecke on 12.11.23.
//

import XCTest

final class NumberExtensionTest: XCTestCase {

    func testIntToDouble() throws {
        let testInt = 15
        XCTAssertEqual(15.0, testInt.toDouble())
    }
    
    func testCentToDollars() throws {
        let cents = 12350
        XCTAssertEqual(123.50, cents.centsToDollars())
    }
    
    func testIntToString() throws {
        XCTAssertEqual("123", 123.toString())
    }
    
    func testDoubleToInt() throws {
        let testDouble = 15.78
        XCTAssertEqual(15, testDouble.toInt())
    }
    
    func testDoubleToString() throws {
        let testDouble = 123.50
        XCTAssertEqual("123.50", testDouble.toString())
    }
    
    func testDoubleToPrice() throws {
        let testPrice = 16.50
        XCTAssertEqual("16,50€", testPrice.toPrice(currency: "€"))
    }
    
    func testCelsiusToFahrenheit() throws {
        let testCelsius = 16.0
        XCTAssertEqual(60.8, testCelsius.celsiusToFahrenheit())
    }
    
    func testFahrenheitToCelsius() throws {
        let testCelsius = 60.8
        XCTAssertEqual(16.0, testCelsius.fahrenheitToCelsius())
    }
    
    func testKilometreToMiles() throws {
        let testKilometre = 10.0
        XCTAssertEqual(6.21371, testKilometre.kilometerToMiles())
    }
    
    func testMilesToKilometre() throws {
        let testMiles = 5.0
        XCTAssertEqual(8.0467, testMiles.milesToKilometer())
    }
    
    func testKilowattToPs() throws {
        let testKW = 50.0
        XCTAssertEqual(67.98108085, testKW.kwToPs())
    }
    
    func testPsToKilowatt() throws {
        let testPS = 80.0
        XCTAssertEqual(58.8399, testPS.psToKw())
    }
    
    func testRoundTo() throws {
        var roundValue = 213.3244
        roundValue.roundTo(places: 1)
        XCTAssertEqual(213.3, roundValue)
    }
}
