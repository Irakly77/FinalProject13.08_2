//
//  SwiftUIView.swift
//  
//
//  Created by Ульяна Евстигнеева on 12.08.2024.
//

import SwiftUI

public struct TextView: View {
    let headlineFont: Color
    let text: String
    
    public init(headlineFont: Color, text: String) {
        self.headlineFont = headlineFont
        self.text = text
    }
    
    public var body: some View {
        Text(NSLocalizedString(text, comment: ""))
            .font(.system(size: 14))
            .foregroundStyle(headlineFont)

    }
}


//#Preview {
//    TextView(headlineFont: .blue, text: "text")
//
//}
