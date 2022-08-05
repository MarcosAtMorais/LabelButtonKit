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
public struct SimpleListExampleView: View {
    
    // MARK: Properties
    @State var labelButtons: [LabelButton] = [LabelButton(backgroundColor: .purple.opacity(0.50)), LabelButton(), LabelButton()]
    
    // MARK: - Initializer
    public init(labelButtons: [LabelButton] = [LabelButton(backgroundColor: .purple.opacity(0.50)), LabelButton(), LabelButton()]) {
        self.labelButtons = labelButtons
    }
    
    // MARK: - View
    public var body: some View {
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
