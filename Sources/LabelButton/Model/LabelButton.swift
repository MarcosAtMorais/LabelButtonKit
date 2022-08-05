//
//  ButtonLabel.swift
//  
//
//  Created by Marcos Morais on 01/08/22.
//

import Foundation
import SwiftUI
/**
 This struct conforms to Labelable and can be used to populate our buttons with the correct data.
 */
public struct LabelButton: Labelable, Identifiable {
    
    /// The Identifiable protocol conformance
    public var id: String = UUID().uuidString
    
    /// The icon consists of the string for the desired SFSymbol
    var icon: String = String("square.and.arrow.down.fill")
    /// The text consists of a string that will be displayed on top or right of the icon.
    var text: String = String("Directions")
    /// The color for our text
    var textColor: Color = .primary
    /// The color for our symbol
    var iconColor: Color = .primary
    /// The backgroundColor for our button
    var backgroundColor: Color = Color.secondary.opacity(0.15)
    /// The color opacity for our button as a whole
    var colorOpacity: CGFloat = 0.75
    /// The frame (width and height) of our button
    var frame: CGSize = CGSize(width: 125, height: 75)
    /// A callback that can be used as the action for the pressing of our button
    var action: () -> () = { }
    
}
