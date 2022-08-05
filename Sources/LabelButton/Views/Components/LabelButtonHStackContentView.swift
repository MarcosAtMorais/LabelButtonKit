//
//  LabelButtonHStackContentView.swift
//  
//
//  Created by Marcos Morais on 05/08/22.
//

import SwiftUI

struct LabelButtonHStackContentView: View {
    
    /// Binding to the Label on LabelButtonView
    @Binding var icon: String
    @Binding var text: String
    @Binding var iconColor: Color
    @Binding var textColor: Color
    @Binding var colorOpacity: CGFloat
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .stylizeIcon(using: iconColor, opacity: colorOpacity)
            Spacer().frame(maxWidth: 15)
            Text(text)
                .stylizeCaption(using: textColor)
            Spacer()
        }
    }
}

struct LabelButtonHStackContentView_Previews: PreviewProvider {
    static var previews: some View {
        LabelButtonHStackContentView(icon: .constant(LabelButton.default.icon), text: .constant(LabelButton.default.text), iconColor: .constant(LabelButton.default.iconColor), textColor: .constant(LabelButton.default.textColor), colorOpacity: .constant(LabelButton.default.colorOpacity))
    }
}
