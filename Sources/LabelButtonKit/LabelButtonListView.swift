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
    
    // MARK: - Properties
    /// The environment object containing the SizeCategory for DynamicType/accessibility purposes
    @Environment(\.dynamicTypeSize) var sizeCategory
    
    /// The vertical alignment for the HStack, if needed
    @State public var verticalAlignment: VerticalAlignment = .center
    /// The horizontal alignment for the VStack, if needed
    @State public var horizontalAlignment: HorizontalAlignment = .center
    /// The spacing in between elements of the stack
    @State public var spacing: CGFloat? = nil
    /// Our source of truth
    public var data: [LabelButton] = []
    
    /// A computed property that verifies if the label must be vertical or horizontal according to DynamicType
    var needsLargerContent: Bool {
        sizeCategory >= .xxLarge || data.count > 5
    }
    
    // MARK: - Initializer
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
    
    // MARK: - View
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
