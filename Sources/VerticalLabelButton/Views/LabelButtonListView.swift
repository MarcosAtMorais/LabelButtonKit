//
//  LabelButtonListView.swift
//  
//
//  Created by Marcos Morais on 01/08/22.
//

import SwiftUI

struct LabelButtonListView: View {
    
    @Environment(\.sizeCategory) var sizeCategory
    
    var verticalAlignment: VerticalAlignment = .center
    var horizontalAlignment: HorizontalAlignment = .center
    let spacing: CGFloat?
    let data: [ButtonLabel]
    
    @inlinable public init(
        verticalAlignment: VerticalAlignment = .center,
        horizontalAlignment: HorizontalAlignment = .center,
        spacing: CGFloat? = nil,
        data: [ButtonLabel]
    ) {
        self.horizontalAlignment = horizontalAlignment
        self.verticalAlignment = verticalAlignment
        self.spacing = spacing
        self.data = data
    }
    
    var needsLargerContent: Bool {
        sizeCategory > ContentSizeCategory.extraLarge
    }
    
    var body: some View {
        
        if !needsLargerContent {
            HStack(alignment: verticalAlignment, spacing: spacing) {
                ForEach(data) { label in
                    VerticalLabelButtonView(label: label)
                }
            }
        } else {
            VStack(alignment: horizontalAlignment, spacing: spacing) {
                ForEach(data) { label in
                    VerticalLabelButtonView(label: label)
                }
            }
        }
        
    }
    
}


struct LabelButtonListView_Previews: PreviewProvider {
    static var previews: some View {
        LabelButtonListView(data: [ButtonLabel(), ButtonLabel()])
    }
}
