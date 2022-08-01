//
//  ButtonLabel.swift
//  
//
//  Created by Marcos Morais on 01/08/22.
//

import Foundation

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
