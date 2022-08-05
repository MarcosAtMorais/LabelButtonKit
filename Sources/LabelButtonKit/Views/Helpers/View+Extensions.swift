//
//  View+Extensions.swift
//  
//
//  Created by Marcos Morais on 01/08/22.
//

import SwiftUI

extension View {
    
    /**
     Simple styling with font (as .headline and rounded design), minimumScaleFactor for dynamicType when applicable and a foregroundColor for the text/symbol.
     
      - parameters:
         - color: a foregroundColor that is going to be applied to the source (text or symbol).
     
      - returns: A view with the ViewModifier applied, with the font (.headline and rounded), minimumScaleFactor of 0.25 and the foregroundColor.

     */
    func stylizeHeadline(using color: Color = .primary) -> some View {
        modifier(StylizeHeadline(color: color))
    }
    
    /**
     Simple styling with font (as .caption, rounded design and a bold aspect), imageScaling for dynamicType when applicable and a foregroundColor for the text/symbol, as well as opacity.
     
      - parameters:
         - color: a foregroundColor that is going to be applied to the source (text or symbol).
         - opacity: a CGFloat that will be used as the opacity.
     
      - returns: A view with the ViewModifier applied, with the font (.title and rounded), imageScaling of .large, the color as the foregroundColor and the opacity.

     */
    func stylizeIcon(using color: Color, opacity: CGFloat) -> some View {
        modifier(StylizeIcon(color: color, colorOpacity: opacity))
    }
    
    /**
     Simple styling with font (as .caption, rounded design and a bold aspect), minimumScaleFactor for dynamicType when applicable and a foregroundColor for the text/symbol.
     
      - parameters:
         - color: a foregroundColor that is going to be applied to the source (text or symbol).
     
      - returns: A view with the ViewModifier applied, with the font (.caption and rounded), minimumScaleFactor of 0.25 and the color as the foregroundColor.

     */
    func stylizeCaption(using color: Color = .primary) -> some View {
        modifier(StylizeCaption(color: color))
    }
    
    /**
     A container SwiftUI view where the content is aligned correctly both vertically and horizontally, using a minimum spacing/padding if needed. If not, 0 spacing would do the trick.
     
      - parameters:
         - colors: the horizontal spacing that both .leading and .trailing are going to minumumly have.
         - opacity: the vertical spacing that both .top and .bottom are going to minumumly have.
         - shadowRadius: a radius for the shadow that is going to be applied to the view.
     
      - returns: A view with the ViewModifier applied, with minimumSpacing applied and centered at all edges. Default is horizontalMinimumSpacing = 0 and verticalMinimumSpacing = 0
     */
    func spaceAtAllSides(horizontalMinimumSpacing: CGFloat = 0, verticalMinimumSpacing: CGFloat = 0) -> some View {
        modifier(AllSidesSpacer(horizontalMinimumSpacing: horizontalMinimumSpacing, verticalMinimumSpacing: verticalMinimumSpacing))
    }

}
