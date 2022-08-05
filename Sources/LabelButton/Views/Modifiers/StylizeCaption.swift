//
//  StylizeCaption.swift
//  
//
//  Created by Marcos Morais on 03/08/22.
//

import Foundation
import SwiftUI

/**
 Simple styling with font (as .caption, rounded design and a bold aspect), minimumScaleFactor for dynamicType when applicable and a foregroundColor for the text/symbol.
 */
struct StylizeCaption: ViewModifier {
    
    /// Color of the given text/symbol.
    @State var color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.system(.caption, design: .rounded).bold())
            .minimumScaleFactor(0.25)
            .foregroundColor(color)
    }
    
}
