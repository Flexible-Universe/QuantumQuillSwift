//
//  File.swift
//  
//
//  Created by Rolf Warnecke on 12.11.23.
//

import Foundation

/// These functions provide a variety of date manipulation and comparison operations in Swift. From converting
/// dates to strings with specific formats, adding or subtracting months, days, weeks, or years, to calculating the
/// time components between two dates and comparing dates using a custom enum. These functions offer
/// versatile tools for working with dates in different scenarios.
public extension Date {
    /// Converts the Date object to a string representation using the specified format.
    ///
    /// Example:
    ///   ```
    ///   let currentDate = Date()
    ///   let dateString = currentDate.toString(format: "MMMM dd, yyyy")
    ///   print(dateString) // Output: "January 15, 2023"
    ///   ```
    ///
    /// - Parameter format: The format for the resulting date string.
    /// - Returns: A string representation of the date in the specified format.
    func toString(format: String) -> String {
        let df = DateFormatter()
        df.dateFormat = format
        return df.string(from: self)
    }
    /// Adds a specified number of months to a given date, returning the resulting Date object.
    ///
    /// Example:
    ///   ```
    ///   let currentDate = Date()
    ///   if let futureDate = addMonthToDate(monthValue: 3, customDate: currentDate) {
    ///       print(futureDate) // Output: Date representing the current date plus 3 months
    ///   }
    ///   ```
    ///
    /// - Parameters:
    ///   - monthValue: The number of months to add to the date.
    ///   - customDate: The base Date object to which months will be added.
    /// - Returns: A new Date object representing the result of adding the specified months to the input date,
    ///            or nil if the operation cannot be performed.
    func addMonthToDate(monthValue: Int) -> Date? {
        return Calendar.current.date(byAdding: .month, value: monthValue, to: self)
    }
    /// Adds a specified number of days to the current date, returning the resulting Date object.
    ///
    /// Example:
    ///   ```
    ///   let currentDate = Date()
    ///   if let futureDate = addDaysToDate(dayValue: 7) {
    ///       print(futureDate) // Output: Date representing the current date plus 7 days
    ///   }
    ///   ```
    ///
    /// - Parameter dayValue: The number of days to add to the current date.
    /// - Returns: A new Date object representing the result of adding the specified days to the current date,
    ///            or nil if the operation cannot be performed.
    func addDaysToDate(dayValue: Int) -> Date? {
        return Calendar.current.date(byAdding: .day, value: dayValue, to: self)
    }
    /// Adds a specified number of weeks to the current date, returning the resulting Date object.
    ///
    /// Example:
    ///   ```
    ///   let currentDate = Date()
    ///   if let futureDate = addWeeksToDate(weekValue: 2) {
    ///       print(futureDate) // Output: Date representing the current date plus 2 weeks
    ///   }
    ///   ```
    ///
    /// - Parameter weekValue: The number of weeks to add to the current date.
    /// - Returns: A new Date object representing the result of adding the specified weeks to the current date,
    ///            or nil if the operation cannot be performed.
    func addWeeksToDate(weekValue: Int) -> Date? {
        return Calendar.current.date(byAdding: .weekOfYear, value: weekValue, to: self)
    }
    /// Adds a specified number of years to the current date, returning the resulting Date object.
    ///
    /// Example:
    ///   ```
    ///   let currentDate = Date()
    ///   if let futureDate = addYearToDate(yearValue: 5) {
    ///       print(futureDate) // Output: Date representing the current date plus 5 years
    ///   }
    ///   ```
    ///
    /// - Parameter yearValue: The number of years to add to the current date.
    /// - Returns: A new Date object representing the result of adding the specified years to the current date,
    ///            or nil if the operation cannot be performed.
    func addYearToDate(yearValue: Int) -> Date? {
        return Calendar.current.date(byAdding: .year, value: yearValue, to: self)
    }
    /// Retrieves the Date object representing the previous year from the current date.
    ///
    /// Example:
    ///   ```
    ///   let currentDate = Date()
    ///   if let previousYearDate = getPreviousYear() {
    ///       print(previousYearDate) // Output: Date representing the previous year from the current date
    ///   }
    ///   ```
    ///
    /// - Returns: A new Date object representing the date one year before the current date,
    ///            or nil if the operation cannot be performed.
    func getPreviousYear() -> Date? {
        return Calendar.current.date(byAdding: .year, value: -1, to: self)
    }
    /// Retrieves the Date object representing the next year from the current date.
    ///
    /// Example:
    ///   ```
    ///   let currentDate = Date()
    ///   if let nextYearDate = getNextYear() {
    ///       print(nextYearDate) // Output: Date representing the next year from the current date
    ///   }
    ///   ```
    ///
    /// - Returns: A new Date object representing the date one year after the current date,
    ///            or nil if the operation cannot be performed.
    func getNextYear() -> Date? {
        return Calendar.current.date(byAdding: .year, value: 1, to: self)
    }
    /// Calculates the time components (years, months, days, hours, minutes, seconds) between two dates.
    ///
    /// Example:
    ///   ```
    ///   let currentDate = Date()
    ///   let earlierDate = someEarlierDate // Replace with an actual Date object
    ///   let timeComponents = currentDate.getTimeBetweenDates(previousDate: earlierDate)
    ///   print(timeComponents)
    ///   ```
    ///
    /// - Parameter previousDate: The Date object representing the earlier point in time.
    /// - Returns: A tuple containing the time components between the two dates.
    ///            Each component is represented as an optional integer.
    ///            Returns 0 for any component if the operation cannot be performed.
    func getTimeBetweenDates(endDate: Date) -> (years: Int, months: Int, weeks: Int, days: Int, hours: Int, minutes: Int, seconds: Int) {
        let delta = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self, to: endDate)

        let weeksAndDays: (Int, Int) = {
            guard let days = delta.day else { return (0, 0) }
            return (days / 7, days % 7)
        }()
        
        return (years: abs(delta.year ?? 0),
                months: abs(delta.month ?? 0),
                weeks: abs(weeksAndDays.0),
                days: abs(weeksAndDays.1),
                hours: abs(delta.hour ?? 0),
                minutes: abs(delta.minute ?? 0),
                seconds: abs(delta.second ?? 0))
    }
    /// Compares the current date with a given previous date and returns a DateComparison enum.
    ///
    /// Example:
    ///   ```
    ///   let currentDate = Date()
    ///   let earlierDate = someEarlierDate // Replace with an actual Date object
    ///   let comparisonResult = getDateComparison(previousDate: earlierDate)
    ///   print(comparisonResult)
    ///   ```
    ///
    /// - Parameter previousDate: The Date object representing the earlier point in time.
    /// - Returns: A DateComparison enum indicating the relationship between the current date and the provided previous date.
    func getDateComparsion(previousDate: Date) -> DateComparsion {
        let dateCompare = self.compare(previousDate)
        switch dateCompare {
        case .orderedAscending:
            return .future
        case .orderedDescending:
            return .past
        default:
            return .same
        }
    }
}

/// An enumeration representing the result of comparing two Date objects.
public enum DateComparsion {
    /// Indicates that the compared date is in the future relative to the reference date.
    case future
    /// Indicates that the compared date is in the past relative to the reference date.
    case past
    /// Indicates that the compared date is the same as the reference date.
    case same
}
