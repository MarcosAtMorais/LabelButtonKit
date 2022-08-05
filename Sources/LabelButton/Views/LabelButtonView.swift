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
struct LabelButtonView: View {
    
    /// The environment object containing the SizeCategory for DynamicType/accessibility purposes
    @Environment(\.sizeCategory) var sizeCategory
    
    /// An object conforming to the Labelable protocol, containing everything needed to build this View
    @State var label: Labelable
    
    /// A callback that mirrors the label 'action' callback.
    var action: () -> () {
        self.label.action
    }
    
    /// A computed property that verifies if the label must be vertical or horizontal according to DynamicType
    var needsLargerContent: Bool {
        sizeCategory > ContentSizeCategory.extraLarge
    }
    
    var body: some View {
        Button(action: label.action) {
            
            if needsLargerContent {
                HStack {
                    Image(systemName: label.icon)
                        .stylizeIcon(using: label.iconColor, opacity: label.colorOpacity)
                    Spacer().frame(maxWidth: 15)
                    Text(label.text)
                        .stylizeCaption(using: label.textColor)
                    Spacer()
                }
            } else {
                VStack {
                    Image(systemName: label.icon)
                        .stylizeIcon(using: label.iconColor, opacity: label.colorOpacity)
                    Spacer().frame(maxHeight: 5)
                    Text(label.text)
                        .stylizeCaption(using: label.textColor)
                }
            }
            
        }
        .buttonStyle(RoundedButtonStyle(horizontalPadding: 5, backgroundColor: label.backgroundColor))
        .frame(maxWidth: .infinity, maxHeight: label.frame.height)
    }
}

struct LabelButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LabelButtonView(label: LabelButton())
            .environment(\.sizeCategory, .large)
            
            
    }
}
