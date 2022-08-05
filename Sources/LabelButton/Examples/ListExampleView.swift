//
//  ListExampleView.swift
//  
//
//  Created by Marcos Morais on 01/08/22.
//

import SwiftUI

struct ListExampleView: View {
    var body: some View {
        LabelButtonListView(data: createLabels())
            .padding([.leading, .trailing], 10)
    }
    
    private func createLabels() -> [LabelButton] {
        let labelOne = LabelButton(textColor: .accentColor, iconColor: .accentColor, backgroundColor: .accentColor.opacity(0.15))
        let labelTwo = LabelButton(text: "Sparks")
        let labelThree = LabelButton()
        
        return [labelOne, labelTwo, labelThree, labelOne]
    }
}

struct ListExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ListExampleView()
    }
}
