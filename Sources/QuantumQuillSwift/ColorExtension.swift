//
//  ColorExtension.swift
//
//
//  Created by Rolf Warnecke on 13.11.23.
//

import Foundation
#if canImport(UIKit)
import UIKit
#endif

/// This set of convenience initializers extends UIColor, providing easy ways to create color instances. The first
/// initializer allows creating a color from a hexadecimal string representation with an optional alpha value. The
/// second initializer creates a color from RGB values, and the third initializer adds the flexibility to specify a
/// custom alpha value along with the RGB components. These initializers simplify the process of creating
/// UIColor instances with various color representations.
#if os(iOS)
public extension UIColor {
    /// Creates a UIColor instance from a hexadecimal string representation with an optional alpha value.
    ///
    /// Example:
    ///   ```
    ///   let hexColorString = "#FF5733"
    ///   let color = UIColor(hexFromString: hexColorString, alpha: 0.8)
    ///   ```
    ///
    /// - Parameters:
    ///   - hexFromString: The hexadecimal string representing the color.
    ///   - alpha: The alpha value for the color (default is 1.0).
    convenience init(hexFromString:String, alpha:CGFloat = 1.0) {
        var cString:String = hexFromString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        var rgbValue:UInt64 = 10066329 //color #999999 if string has wrong format
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.count) == 6) {
            Scanner(string: cString).scanHexInt64(&rgbValue)
        }
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
    /// Creates a UIColor instance from RGB values.
    ///
    /// Example:
    ///   ```
    ///   let color = UIColor(red: 255, green: 87, blue: 51)
    ///   ```
    ///
    /// - Parameters:
    ///   - red: The red component of the color.
    ///   - green: The green component of the color.
    ///   - blue: The blue component of the color.
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    /// Creates a UIColor instance from RGB values with a specified alpha value.
    ///
    /// Example:
    ///   ```
    ///   let color = UIColor(red: 255, green: 87, blue: 51, reqAlpha: 0.8)
    ///   ```
    ///
    /// - Parameters:
    ///   - red: The red component of the color.
    ///   - green: The green component of the color.
    ///   - blue: The blue component of the color.
    ///   - reqAlpha: The alpha value for the color.
    convenience init(red: Int, green: Int, blue: Int, reqAlpha: CGFloat) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: reqAlpha)
    }
}
#endif
