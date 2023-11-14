//
//  StringExtensions.swift
//
//
//  Created by Rolf Warnecke on 12.11.23.
//

import Foundation
import CoreLocation

public extension String {
    /// Trim the String (remove all white spaces and new lines)
    /// - Returns: A string without white spaces in front and back and new lines
    var trimmed: String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    /// Trim the String (remove all white spaces and new lines)
    /// - Returns: A string without white spaces in front and back and new lines
    mutating func trim() {
        self = self.trimmed
    }
    
    /// Convert String Coordinates to CLLocationCoordinates. The coordinates must be seperate by comma.
    ///
    /// Beispiel:
    /// ```swift
    /// let strCoordinates = "41.6168, 41.6367"
    /// let coordinates = strCoordinates.asCoordinates
    /// ```
    ///
    /// - Returns: A CLLocationCoordinate2D object with the coordinates from the string
    var asCoordinates: CLLocationCoordinate2D? {
        let components = self.components(separatedBy: ",")
        if components.count != 2 { return nil }
        let strLat = components[0].trimmed
        let strLng = components[1].trimmed
        if let dLat = Double(strLat),
            let dLng = Double(strLng) {
            return CLLocationCoordinate2D(latitude: dLat, longitude: dLng)
        }
        return nil
    }
    
    /// Convert String into URL
    /// - Returns: The string as a URL
    var asURL: URL? {
        URL(string: self)
    }
    
    /// Get only the last path component
    /// - Returns: The last path component as a string
    var lastPathComponent: String {
        return (self as NSString).lastPathComponent
    }
    /// Get the extension of the path
    /// - Returns: Return the path extension
    var pathExtension: String {
        return (self as NSString).pathExtension
    }
    /// Delete the last pasth component
    /// - Returns: The new Path without the last path component
    var stringByDeletingLastPathComponent: String {
        return (self as NSString).deletingLastPathComponent
    }
    /// Delete the path extension
    /// - Returns: The new Path without the path extension
    var stringByDeletingPathExtension: String {
        return (self as NSString).deletingPathExtension
    }
    /// Split the path into all components
    /// - Returns:Return an array of all path components
    var pathComponents: [String] {
        return (self as NSString).pathComponents
    }
    /// To append a new path component to the current path
    /// - Returns: The new path as a string
    func stringByAppendingPathComponent(path: String) -> String {
        return (self as NSString).appendingPathComponent(path)
    }
    /// To append the new extension to the current path
    /// - Returns: The new path with the new extension
    func stringByAppendingPathExtension(ext: String) -> String? {
        return (self as NSString).appendingPathExtension(ext)
    }
    /// To check if the string contains only digits
    /// - Returns: **True** if the string contains only digits, otherwise **False**
    var containsOnlyDigits: Bool {
        let notDigits = NSCharacterSet.decimalDigits.inverted
        return rangeOfCharacter(from: notDigits, options: String.CompareOptions.literal, range: nil) == nil
    }
    /// To check if the string is alphanumeric
    /// - Returns: **True** if the string was alphanumeric, otherwise **False**
    var isAlphaNumeric: Bool {
        !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
    /// To add a prefix if it not exists
    /// - Returns: The string with then prefix
    func withPrefix(_ prefix: String) -> String {
        if self.hasPrefix(prefix) { return self }
        return "\(prefix)\(self)"
    }
    /// To check if the email address is valid
    /// - Returns: ** True** if the mail address is valid, otherwise **False**
    func isEmailValid() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }
    /// Tock if the phone number is valid
    /// - Returns: **True* if the phone number is valid, othrwise **False**
    func isPhoneNumberValid() -> Bool {
        let regEx = "^\\+(?:[0-9]?){6,14}[0-9]$"

        let phoneCheck = NSPredicate(format: "SELF MATCHES[c] %@", regEx)
        return phoneCheck.evaluate(with: self)
    }
}


