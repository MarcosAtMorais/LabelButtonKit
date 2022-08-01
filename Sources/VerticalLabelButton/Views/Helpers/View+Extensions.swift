//
//  View+Extensions.swift
//  
//
//  Created by Marcos Morais on 01/08/22.
//

import SwiftUI

extension View {
    func stylizeIcon(using color: Color, opacity: CGFloat) -> some View {
        modifier(StylizeIcon(color: color, colorOpacity: opacity))
    }
    
    func stylizeCaption(using color: Color, opacity: CGFloat) -> some View {
        modifier(StylizeCaption(color: color))
    }
    
    func spaceAllSides(horizontalPadding: CGFloat = 5, verticalPadding: CGFloat = 5) -> some View {
        modifier(AllSidesSpacer(horizontalPadding: horizontalPadding, verticalPadding: verticalPadding))
    }
}
