//
//  FormattedExtensionTests.swift
//  
//
//  Created by Rolf Warnecke on 12.11.23.
//

import XCTest

final class FormattedExtensionTests: XCTestCase {

    private let initialStringDate = "2020-08-10 15:00:00"
    private let initialDateFormat = "yyyy-MM-dd HH:mm:ss"
    private var initialDate: Date?
    
    override func setUpWithError() throws {
        let dtFormatter = DateFormatter()
        dtFormatter.dateFormat = initialDateFormat
        
        initialDate = dtFormatter.date(from: initialStringDate)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testStringToDate() throws {
        let strDate = "2020-08-10 15:00:00"
        let date = strDate.toDate(format: "yyyy-MM-dd HH:mm:ss")
        XCTAssertEqual(date, initialDate)
    }
    
    func testDateToString() throws {
        guard let initialDate = initialDate else {
            XCTFail("No initial date !!")
            return
        }
        let strDate = initialDate.toString(format: "yyyy-MM-dd HH:mm:ss")
        XCTAssertEqual(strDate, initialStringDate)
    }
}
