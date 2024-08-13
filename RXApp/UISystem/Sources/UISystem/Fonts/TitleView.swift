//
//  SwiftUIView.swift
//  
//
//  Created by Ульяна Евстигнеева on 12.08.2024.
//

import SwiftUI

public struct TitleView: View {
    let headlineFont: Color
    let title: String
    
    public init(headlineFont: Color, title: String) {
        self.headlineFont = headlineFont
        self.title = title
    }
    
    public var body: some View {
        Text(title)
            .font(.system(size: 18))
            .fontWeight(.bold)
            .foregroundStyle(headlineFont)
        
    }
}

//#Preview {
//    TitleView(headlineFont: .red, title: "text")
//}
