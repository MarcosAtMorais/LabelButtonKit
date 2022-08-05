//
//  SimpleListExampleView.swift
//  
//
//  Created by Marcos Morais on 05/08/22.
//

import SwiftUI

/**
 A SwiftUI view with a very simple example using an array of LabelButtons and the container LabelButtonListView.
 */
struct SimpleListExampleView: View {
    
    @State var labelButtons: [LabelButton] = [LabelButton(backgroundColor: .purple.opacity(0.50)), LabelButton(), LabelButton()]
    
    var body: some View {
        LabelButtonListView(data: labelButtons)
            .padding()
    }
    
}

struct SimpleListExampleView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleListExampleView()
            .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
            .previewInterfaceOrientation(.landscapeRight)
    }
}
