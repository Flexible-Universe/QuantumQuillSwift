//
//  File.swift
//  
//
//  Created by Rolf Warnecke on 07.09.24.
//

import SwiftUI

/// This extension is for SwiftUI View
/// Source: https://blog.stackademic.com/swiftui-hacks-with-custom-modifiers-310c24e7078d
extension View {
    /// Shows the size of the component in width and height
    func displaySize() -> some View {
        self.modifier(SizeDisplayModifier())
    }
    
    /// To shows if the labels ord components are not localized
    func localizationHelper() -> some View {
        self.modifier(LocalizationHelperModifier())
    }

    /// Shows helper lines to make your design better
    func layoutGuides(grid: Bool = true, baseline: Bool = true) -> some View {
        self.modifier(LayoutGuidesModifier(grid: grid, baseline: baseline))
    }
}
