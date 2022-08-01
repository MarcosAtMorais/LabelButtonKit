//
//  StylizeIcon.swift
//  
//
//  Created by Marcos Morais on 01/08/22.
//

import SwiftUI
import Foundation

struct StylizeIcon: ViewModifier {
    
    @State var color: Color = .primary
    @State var colorOpacity: CGFloat = 0.75
    
    func body(content: Content) -> some View {
        content
            .font(.system(.title2, design: .rounded))
            .imageScale(.medium)
            .foregroundColor(color.opacity(colorOpacity))
    }
    
}
