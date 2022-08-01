//
//  File.swift
//  
//
//  Created by Marcos Morais on 01/08/22.
//

import SwiftUI
import Foundation

struct RoundedButtonStyle: ButtonStyle {
    
    var horizontalPadding: CGFloat = 10
    var verticalPadding: CGFloat = 5
    var backgroundColor: Color = Color.secondary.opacity(0.15)
    var cornerRadius: CGFloat = 12
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .spaceAllSides()

        .padding([.top, .bottom], verticalPadding)
        .padding([.leading, .trailing], horizontalPadding)
        .background(backgroundColor.cornerRadius(cornerRadius))
        .scaleEffect(configuration.isPressed ? 0.95 : 1)
        .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
    
}
