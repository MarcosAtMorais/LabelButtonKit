//
//  LabelButtonVStackContentView.swift
//  
//
//  Created by Marcos Morais on 05/08/22.
//

import SwiftUI

/**
 A SwiftUI view container that houses a vertical LabelButtonView. (For extraLarge+ dynamic type accessibility)
 */
struct LabelButtonVStackContentView: View {
    
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
        VStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(maxWidth: 35, maxHeight: 35)
                .overlay {
                    Image(systemName: icon)
                        .stylizeIcon(using: iconColor, opacity: colorOpacity)
                }
            Spacer().frame(maxHeight: 5)
            Text(text)
                .stylizeCaption(using: textColor)
        }
    }
}

struct LabelButtonVStackContentView_Previews: PreviewProvider {
    static var previews: some View {
        LabelButtonVStackContentView(icon: .constant(LabelButton.default.icon), text: .constant(LabelButton.default.text), iconColor: .constant(LabelButton.default.iconColor), textColor: .constant(LabelButton.default.textColor), colorOpacity: .constant(LabelButton.default.colorOpacity))
    }
}
