//
//  VerticalLabelButtonView.swift
//  
//
//  Created by Marcos Morais on 29/07/22.
//

import SwiftUI

struct LabelButtonView: View {
    
    @Environment(\.sizeCategory) var sizeCategory
    
    @State var label: Labelable
    
    var action: () -> () {
        self.label.action
    }
    
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
                        .stylizeCaption(using: label.textColor, opacity: label.colorOpacity)
                    Spacer()
                }
            } else {
                VStack {
                    Image(systemName: label.icon)
                        .stylizeIcon(using: label.iconColor, opacity: label.colorOpacity)
                    Spacer().frame(maxHeight: 5)
                    Text(label.text)
                        .stylizeCaption(using: label.textColor, opacity: label.colorOpacity)
                }
            }
            
        }
        .buttonStyle(RoundedButtonStyle(horizontalPadding: 5, backgroundColor: label.backgroundColor))
        .frame(maxWidth: .infinity, maxHeight: label.frame.height)

    }
}

struct LabelButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LabelButtonView(label: ButtonLabel())
            .environment(\.sizeCategory, .large)
            
            
    }
}
