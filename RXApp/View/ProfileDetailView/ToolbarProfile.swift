//
//  ToolbarProfile.swift
//  WBApp
//
//  Created by Аlina Кovtunovich on 17.06.2024.
//

import SwiftUI

struct ToolbarProfile: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {}
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { presentationMode.wrappedValue.dismiss() }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 12))
                            .bold()
                            .padding(.leading, 16)
                            .foregroundColor(Color("fontColor"))
                        Text("Профиль")
                            .font(.system(size: 18))
                            .bold()
                            .foregroundColor(Color("fontColor"))
                            .padding()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image("coopicon")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .bold()
                        .padding(.trailing, 16)
                }
            }
    }
}

struct ToolbarProfile_Previews: PreviewProvider {
    
    static var previews: some View {
        ToolbarProfile()
    }
}
