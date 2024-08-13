//
//  SwiftUIView.swift
//  
//
//  Created by Ульяна Евстигнеева on 12.08.2024.
//


import SwiftUI

public struct ButtonWBView: View {
    
    public let title: String
    public let buttonColor: Color
    public let action: ()->()
    
    
    public init(title: String, action: @escaping () -> Void, buttonColor: Color) {
        self.title = title
        self.action = action
        self.buttonColor = buttonColor
    }
    
    public var body: some View {
        Button(action:action) {
            Text(NSLocalizedString(title, comment: ""))
                .font(.system(size: 16))
                .foregroundStyle(.white)
                .bold()
                .padding()
        .frame(maxWidth: .infinity)
        .background(buttonColor)
        .clipShape(Capsule())
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 40)
    }
}

//#Preview {
//    ButtonWBView(title: "button", action: {}, buttonColor: .red)
//}
