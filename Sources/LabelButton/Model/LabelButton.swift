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
    
    // MARK: - Properties
    
    /// The Identifiable protocol conformance
    public var id: String = UUID().uuidString
    /// A default implementation for tests and previews
    public static var `default` = LabelButton()
    
    /// The icon consists of the string for the desired SFSymbol
    @Published var icon: String
    /// The text consists of a string that will be displayed on top or right of the icon.
    @Published var text: String
    /// The color for our text
    @Published var textColor: Color
    /// The color for our symbol
    @Published var iconColor: Color
    /// The backgroundColor for our button
    @Published var backgroundColor: Color
    /// The color opacity for our button as a whole
    @Published var colorOpacity: CGFloat
    /// The button's cornerRadius.
    @Published var cornerRadius: CGFloat
    /// The button's [.leading, .trailing] padding.
    @Published var horizontalPadding: CGFloat
    /// The button's [.top, .bottom] padding.
    @Published var verticalPadding: CGFloat
    /// The frame (width and height) of our button
    @Published var frame: CGSize
    /// A callback that can be used as the action for the pressing of our button
    @Published var action: () -> ()
    
    // MARK: - Initializers
    
    public init(icon: String = String("arrow.triangle.turn.up.right.circle"), text: String = String("Directions"), textColor: Color = .primary, iconColor: Color = .primary, backgroundColor: Color = Color.secondary.opacity(0.15), colorOpacity: CGFloat = 0.75, cornerRadius: CGFloat = 12, horizontalPadding: CGFloat = 10, verticalPadding: CGFloat = 10, frame: CGSize = CGSize(width: 125, height: 75), action: @escaping () -> () = { }) {
        
        self.icon = icon
        self.text = text
        self.textColor = textColor
        self.iconColor = iconColor
        self.backgroundColor = backgroundColor
        self.colorOpacity = colorOpacity
        self.cornerRadius = cornerRadius
        self.horizontalPadding = horizontalPadding
        self.verticalPadding = verticalPadding
        self.frame = frame
        self.action = action
        
    }
    
}
