//
//  NumberExtension.swift
//
//
//  Created by Rolf Warnecke on 12.11.23.
//

import Foundation

extension Int {
    /// Integer to Double
    /// - Returns: The integer value as a doible
    public func toDouble() -> Double {
        Double(self)
    }
    /// To calculate Cent to Dollars
    /// - Returns: The cents into Dollars or cents to Euros
    public func centsToDollars() -> Double {
        Double(self) / 100
    }
    /// Convert Int to String
    /// - Returns: The integer as a string
    public func toString() -> String {
        "\(self)"
    }
}

public extension Double {
    /// Double to Integer
    /// - Returns: The double value as an integer.
    func toInt() -> Int {
        Int(self)
    }
    /// Convert Double to String with to digits
    /// - Returns: The double value as a string with to digits
    func toString() -> String {
        String(format: "%.02f", self)
    }
    /// Convert double value tp price
    /// - Parameters currency: The currency as a string in word or symbol
    /// - Returns: The complete price label with currency and formatted
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
    /// Convert Celsius to Fahrenheit
    /// - Returns: The fahrenheit value
    func celsiusToFahrenheit() -> Double {
        (self * (9/5)) + 32
    }
    /// Convert Fahrenheit to Celsius
    /// - Returns: The celsius value
    func fahrenheitToCelsius() -> Double {
        (5/9) * (self - 32)
    }
    /// Convert kilometre to miles
    /// - Returns: The miles value
    func kilometreToMiles() -> Double {
        self * 0.621371
    }
    /// Convert miles to kilometre
    /// - Returns: The kilometre value
    func milesToKilometre() -> Double {
        self * 1.60934
    }
    /// Convert kilowatt to horse power
    /// - Returns: The horse power value
    func kwToPs() -> Double {
        self * 1.359621617
    }
    /// Convert horse power to kilowatt
    /// - Returns: The kilowat value
    func psToKw() -> Double {
        self * 0.73549875
    }
    /// To round the value to the called places. At point five it will round up, lower will round down
    /// - Returns: The new rounded double value
    mutating func roundTo(places: Int) {
        let divisor = pow(10.0, places.toDouble())
        self = (self * divisor).rounded() / divisor
    }
}
