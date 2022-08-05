//
//  HorizontalStackExampleView.swift
//  
//
//  Created by Marcos Morais on 29/07/22.
//

import SwiftUI

struct HorizontalStackExampleView: View {
    
    @Environment(\.dynamicTypeSize) var sizeCategory
    
    var needsLargerContent: Bool {
        sizeCategory >= .xxLarge
    }
    
    var body: some View {
                
        if needsLargerContent {
            VStack(spacing: 5) {
                LabelButtonView(label: LabelButton())
                LabelButtonView(label: LabelButton())
                LabelButtonView(label: LabelButton())
                LabelButtonView(label: LabelButton())

            }
        } else {
            HStack(spacing: 5) {
                LabelButtonView(label: LabelButton())
                LabelButtonView(label: LabelButton())
                LabelButtonView(label: LabelButton())
                LabelButtonView(label: LabelButton())
            }
            .padding()
        }

    }
}

struct HorizontalStackExampleView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalStackExampleView()
            .preferredColorScheme(.dark)
            .environment(\.sizeCategory, .extraLarge)
    }
}
