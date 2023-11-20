//
//  FormattedExtensionTests.swift
//  
//
//  Created by Rolf Warnecke on 12.11.23.
//

import XCTest
import QuantumQuillSwift

final class DateExtensionTests: XCTestCase {
    
    private let initialStringDate = "2020-08-10 15:00:00"
    private let initialDateFormat = "yyyy-MM-dd HH:mm:ss"
    private var initialDate: Date?
    
    override func setUpWithError() throws {
        let dtFormatter = DateFormatter()
        dtFormatter.dateFormat = initialDateFormat
        
        initialDate = dtFormatter.date(from: initialStringDate)
    }
    
    func testDateToString() throws {
        guard let initialDate = initialDate else {
            XCTFail("No initial date !!")
            return
        }
        let strDate = initialDate.toString(format: "yyyy-MM-dd HH:mm:ss")
        XCTAssertEqual(strDate, initialStringDate)
    }
    
    func testAddMonthToDatePlus() throws {
        let dtFormatter = DateFormatter()
        dtFormatter.dateFormat = initialDateFormat
        
        let testDate = dtFormatter.date(from: "2020-11-10 15:00:00")
        
        let dateResult = initialDate?.addMonthToDate(monthValue: 3)
        XCTAssertEqual(testDate, dateResult)
    }
    
    func testAddMonthToDateMinus() throws {
        let dtFormatter = DateFormatter()
        dtFormatter.dateFormat = initialDateFormat
        
        let testDate = dtFormatter.date(from: "2020-05-10 15:00:00")
        
        let dateResult = initialDate?.addMonthToDate(monthValue: -3)
        XCTAssertEqual(testDate, dateResult)
    }
    
    func testAddDayToDatePlus() throws {
        let dtFormatter = DateFormatter()
        dtFormatter.dateFormat = initialDateFormat
        
        let testDate = dtFormatter.date(from: "2020-08-17 15:00:00")
        
        let dateResult = initialDate?.addDaysToDate(dayValue: 7)
        XCTAssertEqual(testDate, dateResult)
    }
    
    func testAddDayToDateMinus() throws {
        let dtFormatter = DateFormatter()
        dtFormatter.dateFormat = initialDateFormat
        
        let testDate = dtFormatter.date(from: "2020-08-03 15:00:00")
        
        let dateResult = initialDate?.addDaysToDate(dayValue: -7)
        XCTAssertEqual(testDate, dateResult)
    }
    
    func testAddWeekToDatePlus() throws {
        let dtFormatter = DateFormatter()
        dtFormatter.dateFormat = initialDateFormat
        
        let testDate = dtFormatter.date(from: "2020-08-24 15:00:00")
        
        let dateResult = initialDate?.addWeeksToDate(weekValue: 2)
        XCTAssertEqual(testDate, dateResult)
    }
    
    func testAddWeekToDateMinus() throws {
        let dtFormatter = DateFormatter()
        dtFormatter.dateFormat = initialDateFormat
        
        let testDate = dtFormatter.date(from: "2020-07-27 15:00:00")
        
        let dateResult = initialDate?.addWeeksToDate(weekValue: -2)
        XCTAssertEqual(testDate, dateResult)
    }
    
    func testAddYearToDatePlus() throws {
        let dtFormatter = DateFormatter()
        dtFormatter.dateFormat = initialDateFormat
        
        let testDate = dtFormatter.date(from: "2025-08-10 15:00:00")
        
        let dateResult = initialDate?.addYearToDate(yearValue: 5)
        XCTAssertEqual(testDate, dateResult)
    }
    
    func testAddYearToDateMinus() throws {
        let dtFormatter = DateFormatter()
        dtFormatter.dateFormat = initialDateFormat
        
        let testDate = dtFormatter.date(from: "2015-08-10 15:00:00")
        
        let dateResult = initialDate?.addYearToDate(yearValue: -5)
        XCTAssertEqual(testDate, dateResult)
    }
    
    func testGetPreviousYear() throws {
        let dtFormatter = DateFormatter()
        dtFormatter.dateFormat = initialDateFormat
        
        let testDate = dtFormatter.date(from: "2019-08-10 15:00:00")
        
        let dateResult = initialDate?.getPreviousYear()
        XCTAssertEqual(testDate, dateResult)
    }
    
    func testGetNextYear() throws {
        let dtFormatter = DateFormatter()
        dtFormatter.dateFormat = initialDateFormat
        
        let testDate = dtFormatter.date(from: "2021-08-10 15:00:00")
        
        let dateResult = initialDate?.getNextYear()
        XCTAssertEqual(testDate, dateResult)
    }
    
    func testTimeBetweenDates() throws {
        let dtFormatter = DateFormatter()
        dtFormatter.dateFormat = initialDateFormat
        
        guard let testDate = dtFormatter.date(from: "2021-08-08 17:00:00") else {
            XCTFail("No initial date !!")
            return
        }
        
        let dateResult = initialDate?.getTimeBetweenDates(endDate: testDate)
        
        XCTAssertEqual(0, dateResult?.years)
        XCTAssertEqual(11, dateResult?.months)
        XCTAssertEqual(4, dateResult?.weeks)
        XCTAssertEqual(1, dateResult?.days)
        XCTAssertEqual(2, dateResult?.hours)
        XCTAssertEqual(0, dateResult?.minutes)
        XCTAssertEqual(0, dateResult?.seconds)
    }
    
    func testGetDateComparsionFuture() throws {
        let dtFormatter = DateFormatter()
        dtFormatter.dateFormat = initialDateFormat
        
        guard let testDate = dtFormatter.date(from: "2021-08-08 17:00:00") else {
            XCTFail("No initial date !!")
            return
        }
        
        let dateResult = initialDate?.getDateComparsion(previousDate: testDate)
        XCTAssertEqual(DateComparsion.future, dateResult)
    }
    
    func testGetDateComparsionPast() throws {
        let dtFormatter = DateFormatter()
        dtFormatter.dateFormat = initialDateFormat
        
        guard let testDate = dtFormatter.date(from: "2019-08-08 17:00:00") else {
            XCTFail("No initial date !!")
            return
        }
        
        let dateResult = initialDate?.getDateComparsion(previousDate: testDate)
        XCTAssertEqual(DateComparsion.past, dateResult)
    }
    
    func testGetDateComparsionSame() throws {
        let dtFormatter = DateFormatter()
        dtFormatter.dateFormat = initialDateFormat
        
        guard let testDate = dtFormatter.date(from: "2020-08-10 15:00:00") else {
            XCTFail("No initial date !!")
            return
        }
        
        let dateResult = initialDate?.getDateComparsion(previousDate: testDate)
        XCTAssertEqual(DateComparsion.same, dateResult)
    }
}
