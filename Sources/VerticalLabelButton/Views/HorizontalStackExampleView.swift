//
//  HorizontalStackExampleView.swift
//  
//
//  Created by Marcos Morais on 29/07/22.
//

import SwiftUI

struct HorizontalStackExampleView: View {
    
    @Environment(\.sizeCategory) var sizeCategory
    
    var needsLargerContent: Bool {
        sizeCategory > ContentSizeCategory.extraLarge
    }
    
    var body: some View {
        
        if needsLargerContent {
            VStack(spacing: 5) {
                VerticalLabelButtonView(icon: "pencil.circle.fill") {
                    
                }
                
                VerticalLabelButtonView {
                    
                }
                
                VerticalLabelButtonView {
                    
                }
                
                VerticalLabelButtonView {
                    
                }
            }
        } else {
            HStack(spacing: 5) {
                VerticalLabelButtonView(icon: "pencil.circle.fill") {
                    
                }
                
                VerticalLabelButtonView(backgroundColor: .blue) {
                    
                }
                
                VerticalLabelButtonView {
                    
                }
                
                VerticalLabelButtonView {
                    
                }
            }
            .padding()
        }

    }
}

struct HorizontalStackExampleView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalStackExampleView()
            .preferredColorScheme(.dark)
            
            
            
            
    }
}
