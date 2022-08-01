//
//  SwiftUIView.swift
//  
//
//  Created by Marcos Morais on 01/08/22.
//

import SwiftUI

struct StylizeCaption: ViewModifier {
    
    @State var color: Color = .primary
    
    func body(content: Content) -> some View {
        content
            .font(.system(.headline, design: .rounded))
            .foregroundColor(color)
            .minimumScaleFactor(0.25)
            .lineLimit(1)
    }
    
}
