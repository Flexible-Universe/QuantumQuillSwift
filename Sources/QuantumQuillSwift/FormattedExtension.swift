//
//  File.swift
//  
//
//  Created by Rolf Warnecke on 12.11.23.
//

import Foundation

/// This set of extensions provides a variety of functionality for string manipulation and validation in Swift. It includes
/// properties for obtaining modified versions of the string, properties for converting the string to coordinate or URL
/// representations, and functions for appending or deleting path components and extensions. Additionally, there are
/// functions for string manipulation, such as checking for digit or alphanumeric content, adding prefixes, and
/// validating email addresses and phone numbers.
public extension String {
    /// Converts the string representation of a date to a Date object using the specified format.
    ///
    /// Example:
    ///   ```
    ///   let dateString = "2023-01-15"
    ///   if let date = dateString.toDate(format: "yyyy-MM-dd") {
    ///       print(date) // Output: 2023-01-15 00:00:00 +0000
    ///   }
    ///   ```
    ///
    /// - Parameter format: The format of the date string.
    /// - Returns: A Date object representing the parsed date, or nil if parsing fails.
    func toDate(format: String) -> Date? {
        let df = DateFormatter()
        df.dateFormat = format
        return df.date(from: self)
    }
}

/// This pair of functions facilitates the conversion between Date objects and string representations with a specified
/// date format. The toDate function parses a string into a Date object using the provided format, returning nil if the
/// parsing fails. Conversely, the toString function converts a Date object into a string representation using the
/// specified format. These functions are useful for handling date-related operations and formatting in Swift
/// applications.
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
}
