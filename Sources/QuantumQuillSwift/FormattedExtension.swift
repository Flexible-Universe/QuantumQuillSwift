//
//  File.swift
//  
//
//  Created by Rolf Warnecke on 12.11.23.
//

import Foundation

extension String {
    /// Format String to Date
    /// - Parameter format: The date format as a string
    public func toDate(format: String) -> Date? {
        let df = DateFormatter()
        df.dateFormat = format
        return df.date(from: self)
    }
}

extension Date {
    /// Format Date to String
    /// - Parameter format: The date format as a string
    public func toString(format: String) -> String {
        let df = DateFormatter()
        df.dateFormat = format
        return df.string(from: self)
    }
}
