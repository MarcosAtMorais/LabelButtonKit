//
//  VerticalLabelButtonView.swift
//  
//
//  Created by Marcos Morais on 29/07/22.
//

import SwiftUI

struct VerticalLabelButtonView: View {
    
    @Environment(\.sizeCategory) var sizeCategory
    
    var icon: String = String("square.and.arrow.down.fill")
    var text: String = String("Directions")
    var color: Color = .primary
    var backgroundColor: Color = Color.secondary.opacity(0.15)
    var colorOpacity: CGFloat = 0.75
    var frame: CGSize = CGSize(width: 125, height: 75)
    var action: () -> ()
    
    var needsLargerContent: Bool {
        sizeCategory > ContentSizeCategory.extraLarge
    }
    
    var body: some View {
        Button(action: action) {
            
            if needsLargerContent {
                HStack {
                    Image(systemName: icon)
                        .stylizeIcon(using: color, opacity: colorOpacity)
                    Spacer().frame(maxWidth: 15)
                    Text(text)
                        .stylizeCaption()
                    Spacer()
                }
            } else {
                VStack {
                    Image(systemName: icon)
                        .stylizeIcon(using: color, opacity: colorOpacity)
                    Spacer().frame(maxHeight: 5)
                    Text(text)
                        .stylizeCaption()
                }
            }
            

            
        }
        .buttonStyle(RoundedButtonStyle(horizontalPadding: 5, backgroundColor: backgroundColor))
        .frame(maxWidth: .infinity, maxHeight: frame.height)

    }
}

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

struct AllSidesSpacer: ViewModifier {
    
    @State var horizontalPadding: CGFloat = 5
    @State var verticalPadding: CGFloat = 5
    
    func body(content: Content) -> some View {
        VStack {
            Spacer(minLength: verticalPadding)
            HStack {
                Spacer(minLength: horizontalPadding)
                content
                Spacer(minLength: horizontalPadding)
            }
            Spacer(minLength: verticalPadding)
        }
    }
    
}

struct StylizeCaption: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.system(.headline, design: .rounded))
            .foregroundColor(.primary)
            .minimumScaleFactor(0.25)
            .lineLimit(1)
    }
    
}

extension View {
    func stylizeIcon(using color: Color, opacity: CGFloat) -> some View {
        modifier(StylizeIcon(color: color, colorOpacity: opacity))
    }
    
    func stylizeCaption() -> some View {
        modifier(StylizeCaption())
    }
    
    func spaceAllSides(horizontalPadding: CGFloat = 5, verticalPadding: CGFloat = 5) -> some View {
        modifier(AllSidesSpacer(horizontalPadding: horizontalPadding, verticalPadding: verticalPadding))
    }
}

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

struct VerticalLabelButtonView_Previews: PreviewProvider {
    static var previews: some View {
        VerticalLabelButtonView(action: {})
            .environment(\.sizeCategory, .large)
            
            
    }
}
