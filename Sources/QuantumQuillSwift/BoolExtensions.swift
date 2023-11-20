//
//  File.swift
//  
//
//  Created by Rolf Warnecke on 16.11.23.
//

import Foundation

/// This extension for the Bool type adds a convenient method, toInt(), allowing you to convert a boolean
/// value to its integer representation. The function returns 1 for true and 0 for false. This extension is
/// helpful in situations where you need to represent boolean values as integers, such as when working
/// with APIs or databases that expect integer representations for boolean flags.
public extension Bool {
    /// Extends the Bool type to convert a boolean value to its integer representation.
    ///
    /// Example:
    ///   ```
    ///   let isTrue = true
    ///   let intValue = isTrue.toInt()
    ///   print(intValue) // Output: 1
    ///   ```
    ///
    /// - Returns: An integer representing the boolean value, 1 for `true` and 0 for `false`.
    func toInt() -> Int {
        self ? 1 : 0
    }
}
