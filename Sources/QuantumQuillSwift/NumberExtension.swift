//
//  NumberExtension.swift
//
//
//  Created by Rolf Warnecke on 12.11.23.
//

import Foundation

/// This bundle of extensions provides utility functions for converting between different numeric representations and
/// obtaining string representations. The toDouble function converts an integer to a double, centsToDollars converts
/// a dollar amount in cents to dollars, and toString converts any supported type to its string representation. These
/// functions enhance the versatility of working with numeric and string data in Swift.
public extension Int {
    /// Converts the given integer to a double.
    ///
    /// - Returns: A double value representing the converted integer.
    ///
    /// Example:
    ///   ```
    ///   let integerNumber = 42
    ///   let doubleValue = integerNumber.toDouble()
    ///   print(doubleValue) // Output: 42.0
    ///   ```
    func toDouble() -> Double {
        Double(self)
    }
    /// Converts the given dollar amount in cents to dollars.
    ///
    /// Example:
    ///   ```
    ///   let centsAmount = 1500
    ///   let dollarsValue = centsAmount.centsToDollars()
    ///   print(dollarsValue) // Output: 15.0
    ///   ```
    ///
    /// - Returns: A double value representing the dollar amount.
    func centsToDollars() -> Double {
        Double(self) / 100
    }
    /// Converts the value to its string representation.
    ///
    /// Example:
    ///   ```
    ///   let number = 123
    ///   let stringValue = number.toString()
    ///   print(stringValue) // Output: "123"
    ///   ```
    ///
    /// - Returns: A string representation of the value.
    func toString() -> String {
        "\(self)"
    }
    /// Converts a Integer to a Bool Value
    ///
    /// Example:
    ///   ```
    ///   let testBool = 1.toBool() // true
    ///   ```
    func toBool() -> Bool {
        Bool(truncating: self as NSNumber)
    }
}

/// This set of extensions provides a variety of utility functions for common conversions in Swift. It includes functions
/// for converting between numeric types, temperature units, distance units, and power units, as well as formatting a
/// value as a price with a specified currency symbol. The roundTo function allows for rounding a value to a specific
/// number of decimal places and is a mutating function, modifying the value in place.
public extension Double {
    /// Converts the value to an integer.
    ///
    /// Example:
    ///   ```
    ///   let doubleValue = 42.75
    ///   let integerValue = doubleValue.toInt()
    ///   print(integerValue) // Output: 42
    ///   ```
    ///
    /// - Returns: An integer representation of the value.
    func toInt() -> Int {
        Int(self)
    }
    /// Converts the value to its string representation.
    ///
    /// Example:
    ///   ```
    ///   let number = 123
    ///   let stringValue = number.toString()
    ///   print(stringValue) // Output: "123"
    ///   ```
    ///
    /// - Returns: A string representation of the value.
    func toString() -> String {
        String(format: "%.02f", self)
    }
    /// Converts the value to a formatted price string with the specified currency symbol.
    ///
    /// Example:
    ///   ```
    ///   let priceValue = 25.99
    ///   let formattedPrice = priceValue.toPrice(currency: "$")
    ///   print(formattedPrice) // Output: "$25.99"
    ///   ```
    ///
    /// - Parameter currency: The currency symbol to be used in the formatted string.
    /// - Returns: A string representation of the value as a formatted price.
    func toPrice(currency: String) -> String {
        let nf = NumberFormatter()
        nf.decimalSeparator = ","
        nf.groupingSeparator = "."
        nf.groupingSize = 3
        nf.usesGroupingSeparator = true
        nf.minimumFractionDigits = 2
        nf.maximumFractionDigits = 2
        return (nf.string(from: NSNumber(value: self)) ?? "?") + currency
    }
    /// Converts the temperature from Celsius to Fahrenheit.
    ///
    /// Example:
    ///   ```
    ///   let celsiusTemperature = 25.0
    ///   let fahrenheitTemperature = celsiusTemperature.celsiusToFahrenheit()
    ///   print(fahrenheitTemperature) // Output: 77.0
    ///   ```
    ///
    /// - Returns: A double value representing the temperature in Fahrenheit.
    func celsiusToFahrenheit() -> Double {
        (self * (9/5)) + 32
    }
    /// Converts the temperature from Fahrenheit to Celsius.
    ///
    /// - Returns: A double value representing the temperature in Celsius.
    ///
    /// - Example:
    ///   ```
    ///   let fahrenheitTemperature = 77.0
    ///   let celsiusTemperature = fahrenheitTemperature.fahrenheitToCelsius()
    ///   print(celsiusTemperature) // Output: 25.0
    ///   ```
    func fahrenheitToCelsius() -> Double {
        (5/9) * (self - 32)
    }
    /// Converts the temperature from Celsius to Kelvin.
    ///
    /// - Returns: A double value representing the temperature in Kelvin.
    ///
    /// - Example:
    ///   ```
    ///   let celsiusTemperature = 77.0
    ///   let klevinTemperature = celsiusTemperature.celsiusToKelvin
    ///   print(klevinTemperature) // Output: 350.15
    ///   ```
    func celsiusToKelvin() -> Double {
        self + 273.15
    }
    /// Converts the temperature from Kelvin to Celsius.
    ///
    /// - Returns: A double value representing the temperature in Celsius.
    ///
    /// - Example:
    ///   ```
    ///   let kelvinTemperature = 77.0
    ///   let celsiusTemperature = klevinTemperature.klevinToCelsius()
    ///   print(celsiusTemperature) // Output: -196.15
    ///   ```
    func kelvinToCelsius() -> Double {
        self - 273.15
    }
    /// Converts the temperature from Fahrenheit to Kelvin.
    ///
    /// - Returns: A double value representing the temperature in Kelvin.
    ///
    /// - Example:
    ///   ```
    ///   let fahrenheitTemperature = 10
    ///   let kelvinTemperature = fahrenheitTemperature.fahrenheitToKelvin()
    ///   print(kelvinTemperature) // Output: 260.93
    ///   ```
    func fahrenheitToKelvin() -> Double {
        let celsius = self.fahrenheitToCelsius()
        return celsius.celsiusToKelvin()
    }
    /// Converts the temperature from Kelvin to Fahrenheit.
    ///
    /// - Returns: A double value representing the temperature in Fahrenheit.
    ///
    /// - Example:
    ///   ```
    ///   let kelvinTemperature = 300.0
    ///   let fahrenheitTemperature = kelvinTemperature.kelvinToFahrenheit()
    ///   print(fahrenheitTemperature) // Output: 80.33
    ///   ```
    func KelvinToFahrenheit() -> Double {
        let celsius = self.kelvinToCelsius()
        return celsius.celsiusToFahrenheit()
    }
    /// Converts the distance from kilometers to miles.
    ///
    /// - Returns: A double value representing the distance in miles.
    ///
    /// Example:
    ///   ```
    ///   let kilometers = 10.0
    ///   let miles = kilometers.kilometerToMiles()
    ///   print(miles) // Output: 6.21371
    ///   ```
    func kilometerToMiles() -> Double {
        self * 0.621371
    }
    /// Converts the distance from miles to kilometers.
    ///
    /// - Returns: A double value representing the distance in kilometers.
    ///
    /// Example:
    ///   ```
    ///   let miles = 6.21371
    ///   let kilometers = miles.milesToKilometer()
    ///   print(kilometers) // Output: 10.0
    ///   ```
    func milesToKilometer() -> Double {
        self * 1.60934
    }
    /// Converts power from kilowatts to horsepower.
    ///
    /// Example:
    ///   ```
    ///   let kilowatts = 50.0
    ///   let horsepower = kilowatts.kwToPs()
    ///   print(horsepower) // Output: 67.99
    ///   ```
    ///
    /// - Returns: A double value representing the power in horsepower.
    func kwToPs() -> Double {
        self * 1.359621617
    }
    /// Converts power from horsepower to kilowatts.
    ///
    /// Example:
    ///   ```
    ///   let horsepower = 67.99
    ///   let kilowatts = horsepower.psToKw()
    ///   print(kilowatts) // Output: 50.0
    ///   ```
    ///
    /// - Returns: A double value representing the power in kilowatts.
    func psToKw() -> Double {
        self * 0.73549875
    }
    /// Convert `Double` to `Decimal`, rounding it to `scale` decimal places.
    ///
    /// - Parameters:
    ///   - scale: How many decimal places to round to. Defaults to `0`.
    ///   - mode:  The preferred rounding mode. Defaults to `.plain`.
    /// - Returns: The rounded `Decimal` value.
    func roundedDecimal(to scale: Int = 0, mode: NSDecimalNumber.RoundingMode = .plain) -> Decimal {
        var decimalValue = Decimal(self)
        var result = Decimal()
        NSDecimalRound(&result, &decimalValue, scale, mode)
        return result
    }
}
