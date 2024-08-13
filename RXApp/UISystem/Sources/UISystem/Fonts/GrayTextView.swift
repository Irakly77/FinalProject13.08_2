//
//  SwiftUIView.swift
//  
//
//  Created by Ульяна Евстигнеева on 12.08.2024.
//

import SwiftUI

public struct GrayTextView: View {
    let text: String
    
    public init(text: String) {
        self.text = text
    }
    
    public var body: some View {
        Text(text)
            .font(.system(size: 12))
            .foregroundStyle(.gray)
    }
}


//#Preview {
//    GrayTextView(text: "text")
//}
