//
//  LayoutGuidesModifier.swift
//  
//
//  Created by Rolf Warnecke on 07.09.24.
//

import SwiftUI

/// A visual helper to align your components perfect
/// Source: https://blog.stackademic.com/swiftui-hacks-with-custom-modifiers-310c24e7078d
struct LayoutGuidesModifier: ViewModifier {
    let grid: Bool
    let baseline: Bool

    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { geometry in
                    ZStack {
                        if grid {
                            gridOverlay(for: geometry.size)
                        }
                        if baseline {
                            baselineOverlay(for: geometry.size)
                        }
                    }
                }
            )
    }

    private func gridOverlay(for size: CGSize) -> some View {
        let gridSpacing: CGFloat = 20
        return ZStack {
            ForEach(0..<Int(size.width / gridSpacing), id: \.self) { i in
                Path { path in
                    let x = CGFloat(i) * gridSpacing
                    path.move(to: CGPoint(x: x, y: 0))
                    path.addLine(to: CGPoint(x: x, y: size.height))
                }
                .stroke(Color.blue.opacity(0.3), lineWidth: 0.5)
            }
            ForEach(0..<Int(size.height / gridSpacing), id: \.self) { i in
                Path { path in
                    let y = CGFloat(i) * gridSpacing
                    path.move(to: CGPoint(x: 0, y: y))
                    path.addLine(to: CGPoint(x: size.width, y: y))
                }
                .stroke(Color.blue.opacity(0.3), lineWidth: 0.5)
            }
        }
    }

    private func baselineOverlay(for size: CGSize) -> some View {
        let baselineSpacing: CGFloat = 8
        return VStack(spacing: baselineSpacing) {
            ForEach(0..<Int(size.height / baselineSpacing), id: \.self) { _ in
                Divider()
                    .background(Color.red.opacity(0.3))
            }
        }
    }
}
