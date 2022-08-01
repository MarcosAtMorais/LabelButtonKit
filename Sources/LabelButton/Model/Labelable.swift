//
//  Labelable.swift
//  
//
//  Created by Marcos Morais on 01/08/22.
//

import Foundation
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
