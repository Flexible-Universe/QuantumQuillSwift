//
//  StringExtensionTest.swift
//  
//
//  Created by Rolf Warnecke on 12.11.23.
//

import XCTest
import CoreLocation

final class StringExtensionTest: XCTestCase {
    
    func testTrimmedString() throws {
        let str1 = "  a b c d e   \n"
        let str2 = str1.trimmed
        XCTAssertEqual("a b c d e", str2)
    }
    
    func testTrimString() throws {
        var str1 = "  a b c d e   \n"
        str1.trim()
        XCTAssertEqual("a b c d e", str1)
    }
    
    func testAsCoordinatesValid() throws {
        let strCoordinates = "41.6168, 41.6367"
        guard let coordinates = strCoordinates.asCoordinates else {
            XCTFail("Invalid coordinates")
            return
        }
        XCTAssertTrue(CLLocationCoordinate2DIsValid(coordinates))
    }
    
    func testAsCoordinatesInValid() throws {
        let strCoordinates = "1441.6168, 41.6367"
        guard let coordinates = strCoordinates.asCoordinates else {
            XCTFail("Invalid coordinates")
            return
        }
        XCTAssertFalse(CLLocationCoordinate2DIsValid(coordinates))
    }
    
    func testAsUrl() throws {
        let testUrl = URL(string: "https://medium.com")
        
        let strUrl = "https://medium.com"
        let url = strUrl.asURL
        XCTAssertEqual(url, testUrl)
    }
    
    func testLastPathComponent() throws {
        let testPath = "/Users/foobar/Documents"
        XCTAssertEqual("Documents", testPath.lastPathComponent)
    }
    
    func testPathExtension() throws {
        let testPath = "/Users/foobar/Documents/Test.pdf"
        XCTAssertEqual("pdf", testPath.pathExtension)
    }
    
    func testDeleteingLastPathComponent() throws {
        let testPath = "/Users/foobar/Documents/Test.pdf"
        XCTAssertEqual("/Users/foobar/Documents", testPath.stringByDeletingLastPathComponent)
    }
    
    func testDeletingPathExtension() throws {
        let testPath = "/Users/foobar/Documents/Test.pdf"
        XCTAssertEqual("/Users/foobar/Documents/Test", testPath.stringByDeletingPathExtension)
    }
    
    func testPathComponents() throws {
        let testPath = "/Users/foobar/Documents/Test.pdf"
        var testPathComponents = [String]()
        testPathComponents.append("/")
        testPathComponents.append("Users")
        testPathComponents.append("foobar")
        testPathComponents.append("Documents")
        testPathComponents.append("Test.pdf")
        
        let pathComponents = testPath.pathComponents
        XCTAssertEqual(testPathComponents, pathComponents)
    }
    
    func testAppendingPathComponent() throws {
        let testPath = "/Users/foobar/Documents"
        XCTAssertEqual("/Users/foobar/Documents/Test", testPath.stringByAppendingPathComponent(path: "Test"))
    }
    
    func testAppendingPathExtension() throws {
        let testPath = "/Users/foobar/Documents/Test"
        XCTAssertEqual("/Users/foobar/Documents/Test.pdf", testPath.stringByAppendingPathExtension(ext: "pdf"))
    }
    
    func testStringContainsOnlyDigits() throws {
        XCTAssertTrue("1234567890".containsOnlyDigits)
        XCTAssertFalse("12345+7890".containsOnlyDigits)
    }
    
    func testStringIsAlphaNumeric() throws {
        XCTAssertTrue("asd3kJh43saf".isAlphaNumeric)
        XCTAssertFalse("Kkncs+_s3mM.".isAlphaNumeric)
    }
    func testStringWithPrefixNotExists() throws {
        XCTAssertEqual("https://www.flexible-universe.com", "www.flexible-universe.com".withPrefix("https://"))
    }
    func testStringWidthPrefixIfExists() throws {
        XCTAssertEqual("https://www.flexible-universe.com", "https://www.flexible-universe.com".withPrefix("https://"))
    }
    func testIsEmailValidTrue() throws {
        let testMailAddress = "donald.duck@entenhausen.de"
        XCTAssertTrue(testMailAddress.isEmailValid())
    }
    func testIsEMailValidFalse() throws {
        let testMailAddress = "dd!@entenhausen.com"
        XCTAssertFalse(testMailAddress.isEmailValid())
    }
    
    func testIsPhoneNumberValidTrue() throws {
        let testTelephoneNumber = "+491234567890"
        XCTAssertTrue(testTelephoneNumber.isPhoneNumberValid())
    }
    
    func testIsPhoneNumberValidFalse() throws {
        let testTelephoneNumber = "+49 123 456 789 01"
        XCTAssertFalse(testTelephoneNumber.isPhoneNumberValid())
    }
}
