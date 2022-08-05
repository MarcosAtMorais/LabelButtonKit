//
//  HorizontalStackExampleView.swift
//  
//
//  Created by Marcos Morais on 29/07/22.
//

import SwiftUI

public struct HorizontalStackExampleView: View {
    
    // MARK: - Properties
    /// This example uses the sizeCategory (dynamicTypeSize) just to show that it can be used outside the LabelButtonListView. LabelButtons already adjust accordingly.
    @Environment(\.dynamicTypeSize) var sizeCategory
    
    var needsLargerContent: Bool {
        sizeCategory >= .xxLarge
    }
    
    // MARK: - View
    public var body: some View {
                
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
    }
}
