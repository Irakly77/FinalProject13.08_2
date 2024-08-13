//
//  VerificationCodeView.swift
//  RXApp
//
//  Created by Ульяна Евстигнеева on 12.08.2024.
//
import SwiftUI
import UISystem

struct VerificationCodeView: View {
    @Binding var contact: VerificationModel
    @Binding var isFullScreenPresented: Bool
    @Environment(\.presentationMode) var presentationMode
    @State private var enteredCode: String = ""
    @FocusState private var isTextFieldFocused: Bool
    

    var body: some View {
        VStack {
            Spacer()
            HeadlineTitleView(headlineFont: Color("wbFont"), title: "Enter a code")
                .padding()

            TextView(headlineFont: Color("wbFont"), text: "Sent a code to the number")
            TextView(headlineFont: Color("wbFont"), text: "+7 \(contact.phoneNumber)")
                .multilineTextAlignment(.center)
                .padding(.bottom, 40)
                .padding(.top, 7)

            CodeView(code: contact.code, enteredCode: $enteredCode, isFullScreenPresented: $isFullScreenPresented)
                .padding(.bottom, 20)

            Button(action: {
                enteredCode = ""
            }) {
                Text("Request code again")
                    .foregroundStyle(Color("wbButton"))
            }
            .padding(.bottom, 50)
            Spacer()
        }
        .navigationBarBackButtonHidden()

        .navigationBarItems(
                        leading: Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                                Image(systemName: "chevron.left")
                                .bold()
                                .foregroundStyle(Color("wbFont"))
                        })
        .padding(.all, 10)
        .background(Color("wbBG"))
    }
}
