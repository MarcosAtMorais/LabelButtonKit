//
//  AllSidesSpacer.swift
//  
//
//  Created by Marcos Morais on 01/08/22.
//

import SwiftUI
import Foundation

/**
 Create a SwiftUI view container where the content is aligned correctly both vertically and horizontally, using a minimum spacing/padding if needed. If not, 0 spacing would do the trick.
 */
struct AllSidesSpacer: ViewModifier {
    
    /// Horizontal minimum spacing that both .leading and .trailing are going to minumumly have.
    @State var horizontalMinimumSpacing: CGFloat = 5
    /// Hertical spacing/padding that both .top and .bottom are going to minumumly have.
    @State var verticalMinimumSpacing: CGFloat = 5
    
    /**
     - parameters:
        - horizontalMinimumSpacing: the horizontal spacing that both .leading and .trailing are going to minumumly have.
        - verticalMinimumSpacing: the vertical spacing that both .top and .bottom are going to minumumly have.
     - returns: The view with the ViewModifier applied.
     */
    func body(content: Content) -> some View {
        VStack {
            Spacer(minLength: verticalMinimumSpacing)
            HStack {
                Spacer(minLength: horizontalMinimumSpacing)
                content
                Spacer(minLength: horizontalMinimumSpacing)
            }
            Spacer(minLength: verticalMinimumSpacing)
        }
    }
    
}
