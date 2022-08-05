//
//  File.swift
//  
//
//  Created by Marcos Morais on 01/08/22.
//

import SwiftUI
import Foundation


/**
 ButtonStyle that applies a Rounded aspect, spaces all sides with padding, applies a background color and corner radius. It also animates with an .easeInOut property when pressed.
 */
struct RoundedButtonStyle: ButtonStyle {
    
    /// horizontal padding that both .leading and .trailing are going to have.
    var horizontalPadding: CGFloat = 10
    /// vertical padding that both .leading and .trailing are going to have.
    var verticalPadding: CGFloat = 5
    /// color of the button's background.
    var backgroundColor: Color = Color.secondary.opacity(0.15)
    /// cornerRadius of the button's background.
    var cornerRadius: CGFloat = 12
    
    /**
     Creates the body of the view
     
      - parameters:
        - horizontalMinimumSpacing: the horizontal padding that both .leading and .trailing are going to have.
        - verticalMinimumSpacing: the vertical padding that both .top and .bottom are going to have.
        - backgroundColor: the color of the button's background.
        - cornerRadius: the cornerRadius of the button's background.
     
      - returns: A view with the ViewModifier applied, with the font (.headline and rounded), minimumScaleFactor of 0.25 and the foregroundColor.

     */
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .spaceAllSides()

        .padding([.top, .bottom], verticalPadding)
        .padding([.leading, .trailing], horizontalPadding)
        .background(backgroundColor.cornerRadius(cornerRadius))
        .scaleEffect(configuration.isPressed ? 0.98 : 1)
        .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
    
}
