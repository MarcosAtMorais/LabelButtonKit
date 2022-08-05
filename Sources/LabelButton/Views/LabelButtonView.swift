//
//  VerticalLabelButtonView.swift
//  
//
//  Created by Marcos Morais on 29/07/22.
//

import SwiftUI

/**
 A SwiftUI view that consists of a viewable layer for LabelButton. It is fully compatible with Accessibility aspects. Always with a SFSymbol on top or leading the label text.
 */
public struct LabelButtonView: View {
    
    /// The environment object containing the SizeCategory for DynamicType/accessibility purposes
    @Environment(\.dynamicTypeSize) var sizeCategory

    /// An object conforming to the Labelable protocol, containing everything needed to build this View
    @StateObject var label: LabelButton
    
    /// A callback that mirrors the label 'action' callback.
    var action: () -> () {
        self.label.action
    }
    
    /// A computed property that verifies if the label must be vertical or horizontal according to DynamicType
    var needsLargerContent: Bool {
        sizeCategory >= .xxLarge
    }
    
    public var body: some View {
        Button(action: label.action) {
            if needsLargerContent {
                LabelButtonHStackContentView(icon: $label.icon, text: $label.text, iconColor: $label.iconColor, textColor: $label.textColor, colorOpacity: $label.colorOpacity)
            } else {
                LabelButtonVStackContentView(icon: $label.icon, text: $label.text, iconColor: $label.iconColor, textColor: $label.textColor, colorOpacity: $label.colorOpacity)
            }
        }
        .buttonStyle(RoundedButtonStyle(horizontalPadding: label.horizontalPadding, verticalPadding: label.verticalPadding, backgroundColor: label.backgroundColor, cornerRadius: label.cornerRadius))
        .frame(maxWidth: .infinity, maxHeight: label.frame.height)
    }
}

struct LabelButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LabelButtonView(label: LabelButton())
            .environment(\.sizeCategory, .extraLarge)
            .previewInterfaceOrientation(.portraitUpsideDown)
            
            
    }
}
