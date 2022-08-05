//
//  LabelButtonHStackContentView.swift
//  
//
//  Created by Marcos Morais on 05/08/22.
//

import SwiftUI

/**
 A SwiftUI view container that houses a horizontal LabelButtonView.
 */
struct LabelButtonHStackContentView: View {
    
    //MARK: - Properties
    /// Binding to the Label on LabelButtonView
    @Binding var icon: String
    @Binding var text: String
    @Binding var iconColor: Color
    @Binding var textColor: Color
    @Binding var colorOpacity: CGFloat
    
    // MARK: - Initializer
    public init(icon: Binding<String>, text: Binding<String>, iconColor: Binding<Color>, textColor: Binding<Color>, colorOpacity: Binding<CGFloat>) {
        self._icon = icon
        self._text = text
        self._iconColor = iconColor
        self._textColor = textColor
        self._colorOpacity = colorOpacity
    }
    
    // MARK: - View
    var body: some View {
        HStack {
            Spacer().frame(maxWidth: 5)
            Rectangle()
                .foregroundColor(.clear)
                .frame(maxWidth: 35, maxHeight: 35)
                .overlay {
                    Image(systemName: icon)
                        .stylizeIcon(using: iconColor, opacity: colorOpacity)
                }
            Spacer().frame(maxWidth: 18.5)
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
