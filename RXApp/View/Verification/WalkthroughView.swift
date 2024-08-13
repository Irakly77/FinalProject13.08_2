//
//  WalkthroughView.swift
//  RXApp
//
//  Created by Ульяна Евстигнеева on 12.08.2024.
//

import SwiftUI
import UISystem

struct WalkthroughView: View {
    @State private var showVerificationView = false
    @State private var isFullScreenPresented = true
    
    var body: some View {
        TabBar()
            .fullScreenCover(isPresented: $isFullScreenPresented, content: {
                NavigationStack() {
                    VStack {
                        Image("walkthroughImage")
                            .resizable()
                            .frame(width: 262, height: 271)
                            .padding(.top, 135)
                        
                        HeadlineTitleView(headlineFont: Color("wbFont"), title: "Communicate with friends and family easily")
                            .padding(.top, 42)
                        
                        Spacer()
                        
                        Text(NSLocalizedString("By clicking continue I agree to", comment: ""))
                            .font(.system(size: 10))
                            .foregroundStyle(.gray)
                        
                        
                        HStack(spacing: 0) {
                            TextButton(title: NSLocalizedString("the Privacy Policy", comment: ""))
                            
                            Text(" " + NSLocalizedString("and", comment: "") + " ")
                                .foregroundStyle(.gray)
                                .font(.system(size: 10))
                            
                            TextButton( title: NSLocalizedString("Terms of Use", comment: ""))
                           
                        }
                        
                        ButtonWBView(title: "Start chatting", action: {showVerificationView.toggle()}, buttonColor: Color("wbButton"))
                    }
                    .navigationDestination(isPresented: $showVerificationView, destination: {
                        VerificationView(isFullScreenPresented: $isFullScreenPresented)
                    })
                    .background(Color("wbBG"))
                }
            })
    }
}


struct TextButton: View {
    let title: String
    
    var body: some View {
        Button(action: {

        }) {
            Text(title)
                .font(.system(size: 10))
                .foregroundStyle(Color("wbButton"))
        }
    }
}
