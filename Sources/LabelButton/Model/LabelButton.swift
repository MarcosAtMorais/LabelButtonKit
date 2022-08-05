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
public class LabelButton: Labelable, Identifiable, ObservableObject {
    
    /// The Identifiable protocol conformance
    public var id: String = UUID().uuidString
    
    public static var `default` = LabelButton()
    
    /// The icon consists of the string for the desired SFSymbol
    @Published var icon: String = String("square.and.arrow.down.fill")
    /// The text consists of a string that will be displayed on top or right of the icon.
    @Published var text: String = String("Directions")
    /// The color for our text
    @Published var textColor: Color = .primary
    /// The color for our symbol
    @Published var iconColor: Color = .primary
    /// The backgroundColor for our button
    @Published var backgroundColor: Color = Color.secondary.opacity(0.15)
    /// The color opacity for our button as a whole
    @Published var colorOpacity: CGFloat = 0.75
    /// The frame (width and height) of our button
    @Published var frame: CGSize = CGSize(width: 125, height: 75)
    /// A callback that can be used as the action for the pressing of our button
    @Published var action: () -> ()
    
    public init(icon: String = String("arrow.triangle.turn.up.right.circle"), text: String = String("Directions"), textColor: Color = .primary, iconColor: Color = .primary, backgroundColor: Color = Color.secondary.opacity(0.15), colorOpacity: CGFloat = 0.75, frame: CGSize = CGSize(width: 125, height: 75), action: @escaping () -> () = { }) {
        
        self.icon = icon
        self.text = text
        self.textColor = textColor
        self.iconColor = iconColor
        self.backgroundColor = backgroundColor
        self.colorOpacity = colorOpacity
        self.frame = frame
        self.action = action
        
    }
    
}
