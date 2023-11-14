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

#if os(iOS)
extension UIColor {
    /// Set a UIColor with the HEX value of it example: #7dbf0d
    /// - Parameters:
    /// - hexFromString: The hex value of the color as a string
    public convenience init(hexFromString:String, alpha:CGFloat = 1.0) {
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
    /// Set the UIColor without alpha
    /// - Parameters:
    ///     - red: The red value
    ///     - green: The green value
    ///     - blue: The blue value
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    /// Set the UIColor with alpha
    /// - Parameters:
    ///     - red: The red value
    ///     - green: The green value
    ///     - blue: The blue value
    ///     - reqAlpha: The alpha value
    convenience init(red: Int, green: Int, blue: Int, reqAlpha: CGFloat) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: reqAlpha)
    }
}
#endif
