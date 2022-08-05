//
//  LabelButtonListView.swift
//  
//
//  Created by Marcos Morais on 01/08/22.
//

import SwiftUI

/**
 A SwiftUI view that consists of a container with LabelButtons. It is fully compatible with Accessibility aspects.
 */
public struct LabelButtonListView: View {
    
    /// The environment object containing the SizeCategory for DynamicType/accessibility purposes
    @Environment(\.sizeCategory) var sizeCategory
    
    /// The vertical alignment for the HStack, if needed
    public var verticalAlignment: VerticalAlignment = .center
    /// The horizontal alignment for the VStack, if needed
    public var horizontalAlignment: HorizontalAlignment = .center
    /// The spacing in between elements of the stack
    public let spacing: CGFloat?
    /// Our source of truth
    public let data: [LabelButton]
    
    /**
     An inlinable public init for this view. Creates a SwiftUIView that consists of a container with LabelButtons.
     - parameters:
        - verticalAlignment: The vertical alignment that the HStack will use. It defaults to .center.
        - horizontalAlignment: The horizontal alignment that the VStack will use. It defaults to .center.
        - spacing: The spacing in between elements of the chosen stack.
        - data: An array of ButtonLabels that will build our stacks.
     */
    @inlinable public init(
        verticalAlignment: VerticalAlignment = .center,
        horizontalAlignment: HorizontalAlignment = .center,
        spacing: CGFloat? = nil,
        data: [LabelButton]
    ) {
        self.horizontalAlignment = horizontalAlignment
        self.verticalAlignment = verticalAlignment
        self.spacing = spacing
        self.data = data
    }
    
    /// A computed property that verifies if the label must be vertical or horizontal according to DynamicType
    var needsLargerContent: Bool {
        sizeCategory > ContentSizeCategory.extraLarge
    }
    
    public var body: some View {
        // Verifies if it doesn't need the larger content. If it doesn't, creates an HStack. If so, creates a VStack.
        if !needsLargerContent {
            HStack(alignment: verticalAlignment, spacing: spacing) {
                ForEach(data) { label in
                    LabelButtonView(label: label)
                }
            }
        } else {
            VStack(alignment: horizontalAlignment, spacing: spacing) {
                ForEach(data) { label in
                    LabelButtonView(label: label)
                }
            }
        }
        
    }
    
}

struct LabelButtonListView_Previews: PreviewProvider {
    static var previews: some View {
        LabelButtonListView(data: [LabelButton(), LabelButton()])
    }
}
