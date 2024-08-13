//
//  SwiftUIView 2.swift
//  
//
//  Created by Ульяна Евстигнеева on 12.08.2024.
//

import SwiftUI

public struct HeadlineTitleView: View {
    let headlineFont: Color
    let title: String
    
    public init(headlineFont: Color, title: String) {
        self.headlineFont = headlineFont
        self.title = title
    }
    
    public var body: some View {
        Text(NSLocalizedString(title, comment: ""))
            .font(.system(size: 24))
            .fontWeight(.bold)
            .foregroundStyle(headlineFont)
            .multilineTextAlignment(.center)
    }
}

//#Preview {
//    HeadlineTitleView(headlineFont: .pink, title: "text")
//}
