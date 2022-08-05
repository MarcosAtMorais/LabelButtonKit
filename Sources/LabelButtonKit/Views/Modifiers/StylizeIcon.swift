//
//  StylizeIcon.swift
//  
//
//  Created by Marcos Morais on 01/08/22.
//

import SwiftUI
import Foundation

/**
 Simple styling with font (as .title2 and rounded design), imageScale for dynamicType when applicable and a foregroundColor for the symbol/icon.
 */
struct StylizeIcon: ViewModifier {
    
    /// Color of the given text/symbol.
    @State var color: Color = .primary
    
    /// Color opacity of the given text/symbol.
    @State var colorOpacity: CGFloat = 0.75
    
    func body(content: Content) -> some View {
        content
            .font(.system(.title2, design: .rounded))
            .imageScale(.medium)
            .foregroundColor(color.opacity(colorOpacity))
    }
    
}
