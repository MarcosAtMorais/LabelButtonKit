//
//  HorizontalStackExampleView.swift
//  
//
//  Created by Marcos Morais on 29/07/22.
//

import SwiftUI

struct HorizontalStackExampleView: View {
    
    @Environment(\.sizeCategory) var sizeCategory
    
    var needsLargerContent: Bool {
        sizeCategory > ContentSizeCategory.extraLarge
    }
    
    var body: some View {
                
        if needsLargerContent {
            VStack(spacing: 5) {
                VerticalLabelButtonView(label: ButtonLabel())
                VerticalLabelButtonView(label: ButtonLabel())
                VerticalLabelButtonView(label: ButtonLabel())
                VerticalLabelButtonView(label: ButtonLabel())

            }
        } else {
            HStack(spacing: 5) {
                VerticalLabelButtonView(label: ButtonLabel())
                VerticalLabelButtonView(label: ButtonLabel())
                VerticalLabelButtonView(label: ButtonLabel())
                VerticalLabelButtonView(label: ButtonLabel())
            }
            .padding()
        }

    }
}

struct HorizontalStackExampleView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalStackExampleView()
            .preferredColorScheme(.dark)
            .environment(\.sizeCategory, .extraExtraLarge)
    }
}
