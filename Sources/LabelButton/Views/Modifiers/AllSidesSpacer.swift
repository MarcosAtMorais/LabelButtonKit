//
//  AllSidesSpacer.swift
//  
//
//  Created by Marcos Morais on 01/08/22.
//

import SwiftUI
import Foundation

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
