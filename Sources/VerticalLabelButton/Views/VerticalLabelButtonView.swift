//
//  VerticalLabelButtonView.swift
//  
//
//  Created by Marcos Morais on 29/07/22.
//

import SwiftUI

protocol Labelable {
    
    var icon: String { get set }
    var text: String { get set }
    var textColor: Color { get set }
    var iconColor: Color { get set }
    var backgroundColor: Color { get set }
    var colorOpacity: CGFloat { get set }
    var frame: CGSize { get set }
    var action: () -> () { get set }
    
}

struct ButtonLabel: Labelable, Identifiable {
    
    var id: String = UUID().uuidString
    
    var icon: String = String("square.and.arrow.down.fill")
    var text: String = String("Directions")
    var textColor: Color = .primary
    var iconColor: Color = .primary
    var backgroundColor: Color = Color.secondary.opacity(0.15)
    var colorOpacity: CGFloat = 0.75
    var frame: CGSize = CGSize(width: 125, height: 75)
    var action: () -> () = { }
    
}

struct VerticalLabelButtonView: View {
    
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

struct VerticalLabelButtonView_Previews: PreviewProvider {
    static var previews: some View {
        VerticalLabelButtonView(label: ButtonLabel())
            .environment(\.sizeCategory, .large)
            
            
    }
}
