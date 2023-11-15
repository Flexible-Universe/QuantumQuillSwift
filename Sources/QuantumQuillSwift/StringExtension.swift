//
//  StringExtensions.swift
//
//
//  Created by Rolf Warnecke on 12.11.23.
//

import Foundation
import CoreLocation

/// This set of extensions provides a variety of functionality for string manipulation and validation in Swift. It includes
/// properties for obtaining modified versions of the string, properties for converting the string to coordinate or URL
/// representations, and functions for appending or deleting path components and extensions. Additionally, there are
/// functions for string manipulation, such as checking for digit or alphanumeric content, adding prefixes, and
/// validating email addresses and phone numbers.
public extension String {
    /// A string with leading and trailing whitespaces removed.
    var trimmed: String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    /// Modifies the string in place by removing leading and trailing whitespaces.
    ///
    /// Example:
    ///   ```
    ///   var text = "   Hello, World!   "
    ///   text.trim()
    ///   print(text) // Output: "Hello, World!"
    ///   ```
    mutating func trim() {
        self = self.trimmed
    }
    /// An optional CLLocationCoordinate2D representation of the string assuming it represents coordinates in the format "latitude, longitude".
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
    /// An optional URL representation of the string.
    var asURL: URL? {
        URL(string: self)
    }
    /// The last component of the path.
    var lastPathComponent: String {
        return (self as NSString).lastPathComponent
    }
    /// The path extension of the string.
    var pathExtension: String {
        return (self as NSString).pathExtension
    }
    /// A string formed by deleting the last path component from the original string.
    var stringByDeletingLastPathComponent: String {
        return (self as NSString).deletingLastPathComponent
    }
    /// A string formed by deleting the path extension from the original string.
    var stringByDeletingPathExtension: String {
        return (self as NSString).deletingPathExtension
    }
    /// An array of path components in the string.
    var pathComponents: [String] {
        return (self as NSString).pathComponents
    }
    /// Appends a path component to the string.
    ///
    /// Example:
    ///   ```
    ///   let basePath = "/Users/username/Documents"
    ///   let newPath = basePath.stringByAppendingPathComponent(path: "file.txt")
    ///   print(newPath) // Output: "/Users/username/Documents/file.txt"
    ///   ```
    ///
    /// - Parameter path: The path component to append.
    /// - Returns: A new string formed by appending the given path component.
    func stringByAppendingPathComponent(path: String) -> String {
        return (self as NSString).appendingPathComponent(path)
    }
    /// Appends a path extension to the string.
    ///
    /// Example:
    ///   ```
    ///   let fileName = "document"
    ///   let newFileName = fileName.stringByAppendingPathExtension(ext: "txt")
    ///   print(newFileName) // Output: "document.txt"
    ///   ```
    ///
    /// - Parameter ext: The path extension to append.
    /// - Returns: A new string formed by appending the given path extension.
    func stringByAppendingPathExtension(ext: String) -> String? {
        return (self as NSString).appendingPathExtension(ext)
    }
    /// Checks if the string contains only digits.
    var containsOnlyDigits: Bool {
        let notDigits = NSCharacterSet.decimalDigits.inverted
        return rangeOfCharacter(from: notDigits, options: String.CompareOptions.literal, range: nil) == nil
    }
    /// Checks if the string is alphanumeric.
    var isAlphaNumeric: Bool {
        !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
    /// Prepends a prefix to the string.
    ///
    /// Example:
    ///   ```
    ///   let word = "Swift"
    ///   let newWord = word.withPrefix("Hello ")
    ///   print(newWord) // Output: "Hello Swift"
    ///   ```
    ///
    /// - Parameter prefix: The prefix to add.
    /// - Returns: A new string with the specified prefix.
    func withPrefix(_ prefix: String) -> String {
        if self.hasPrefix(prefix) { return self }
        return "\(prefix)\(self)"
    }
    /// Checks if the string represents a valid email address.
    ///
    /// - Returns: A boolean indicating whether the string is a valid email address.
    func isEmailValid() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }
    /// Checks if the string represents a valid phone number.
    ///
    /// - Returns: A boolean indicating whether the string is a valid phone number.
    func isPhoneNumberValid() -> Bool {
        let regEx = "^\\+(?:[0-9]?){6,14}[0-9]$"

        let phoneCheck = NSPredicate(format: "SELF MATCHES[c] %@", regEx)
        return phoneCheck.evaluate(with: self)
    }
}


