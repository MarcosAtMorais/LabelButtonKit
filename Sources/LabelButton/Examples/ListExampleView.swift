//
//  ListExampleView.swift
//  
//
//  Created by Marcos Morais on 01/08/22.
//

import SwiftUI

struct ListExampleView: View {
    
    /// Example of changing the value of some variable
    @State var result: Int = 0
    /// Example of linking a color to the backgroundColor of the LabelButton
    @State var color: Color = .green.opacity(0.50)
    
    /// An example LabelButton
    @StateObject var labelButtonExample: LabelButton = LabelButton.default
    
    var body: some View {
        VStack {
            LabelButtonListView(data: createLabels())
                .padding([.leading, .trailing], 10)
            Text("\(result)")
                .font(.callout.weight(.bold))
                .hidden()
        }
        .onAppear {
            self.assignAnActionAfterCreated()
        }
    }
    
    private func createLabels() -> [LabelButton] {
        
        /// Creates the first label
        let labelOne = LabelButton(icon: "text.bubble.fill", text: "Translate", textColor: .accentColor, iconColor: .accentColor, backgroundColor: .accentColor.opacity(0.15))
        
        /// Creates the second label
        let labelTwo = LabelButton(icon: "square.and.arrow.up", text: "Share", backgroundColor: color) {
            self.color = .pink.opacity(0.5)
        }
        /// Creates the third label (it has an action in it)
        let labelThree = LabelButton(icon: "sparkles.tv", text: "Play", backgroundColor: .purple.opacity(0.5)) {
            self.result += 1
        }
        
        /// Returns the array
        return [labelOne, labelTwo, labelThree, self.labelButtonExample]
    }
    
    private func assignAnActionAfterCreated() {
        /// Uses the example one and attributes an action after being created
        self.labelButtonExample.action = {
            self.changeBgColorDirectly()
        }
    }
    
    /// Changes the backgroundColor of the button to pink, animated.
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
