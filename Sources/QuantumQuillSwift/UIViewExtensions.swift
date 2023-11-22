//
//  UIViewExtensions.swift
//
//
//  Created by Rolf Warnecke on 22.11.23.
//

import Foundation
#if canImport(UIKit)
import UIKit
#endif

#if os(iOS)
/// These UIView extension functions provide additional customization options for the appearance of a view.
/// 'addCornerRadius' allows you to set a corner radius for a view, 'addBorderLine' adds a customizable border
/// line to a view, and 'makeRounded' quickly rounds the corners of a view. These functions are useful for
/// enhancing the visual presentation of UI elements in a Swift application.
public extension UIView {
    /// Adds a corner radius to the current UIView instance.
    ///
    /// Example:
    ///   ```
    ///   let someView = UIView()
    ///   someView.addCornerRadius(8)
    ///   ```
    ///
    /// - Parameter radius: The radius to apply to the corners. Default value is 4.
    func addCornerRadius(_ radius: CGFloat = 4) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    /// Adds a border line to the current UIView instance.
    ///
    /// Example:
    ///   ```
    ///   let someView = UIView()
    ///   someView.addBorderLine(width: 2, color: .blue)
    ///   ```
    ///
    /// - Parameters:
    ///   - width: The width of the border line. Default value is 1.
    ///   - color: The color of the border line.
    func addBorderLine(width: CGFloat = 1, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
    /// Makes the corners of the current UIView instance rounded.
    ///
    /// Example:
    ///   ```
    ///   let someView = UIView()
    ///   someView.makeRounded()
    ///   ```
    func makeRounded() {
        layer.masksToBounds = false
        layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
    }
}
#endif
