//
//  ListExampleView.swift
//  
//
//  Created by Marcos Morais on 01/08/22.
//

import SwiftUI

struct ListExampleView: View {
    
    @State var result: Int = 0
    @State var color: Color = .blue
    
    @State var labelButtonExample: LabelButton = LabelButton.default
    
    var body: some View {
        VStack {
            LabelButtonListView(data: createLabels())
                .padding([.leading, .trailing], 10)
            Text("\(result)")
        }

    }
    
    private func createLabels() -> [LabelButton] {
        
        let labelOne = LabelButton(textColor: .accentColor, iconColor: .accentColor, backgroundColor: .accentColor.opacity(0.15))
        let labelTwo = LabelButton(text: "Sparks", backgroundColor: color) {
            self.color = .pink.opacity(0.5)
        }
        let labelThree = LabelButton(action: {
            self.result += 1
        })
        
        self.labelButtonExample.action = {
            self.changeBgColorDirectly()
        }
        
        return [labelOne, labelTwo, labelThree, labelOne, labelButtonExample]
    }
    
    private func changeBgColorDirectly() {
        withAnimation {
            self.labelButtonExample.backgroundColor = .pink
        }
    }
}

struct ListExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ListExampleView()
            
    }
}
