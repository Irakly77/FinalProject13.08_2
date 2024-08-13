//
//  VerificationView.swift
//  RXApp
//
//  Created by Ульяна Евстигнеева on 12.08.2024.
//

import SwiftUI
import UISystem

struct VerificationView: View {
    @State private var contact = VerificationModel(phoneNumber: "", code: "4444")
    @Binding var isFullScreenPresented: Bool

    @State private var showVerificationCodeView: Bool = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
            VStack {
                Spacer()
                
                HeadlineTitleView(headlineFont: Color("wbFont"), title: "Enter your phone number")
                    .padding()

                TextView(headlineFont: Color("wbFont"), text: "We will send a confirmation code to the number provided")
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 40)
                    .lineSpacing(7)
                

                NumberView(number: $contact.phoneNumber)
                    .frame(width: 327, height: 36)

                Spacer()

                ButtonWBView(title: "Continue", action: {
                    if contact.phoneNumber.count == 13 { showVerificationCodeView.toggle() }}, buttonColor: Color("wbButton"))
            }
            .navigationBarBackButtonHidden()
            .navigationDestination(isPresented: $showVerificationCodeView) {
                VerificationCodeView(contact: $contact, isFullScreenPresented: $isFullScreenPresented)
            }
            .navigationBarItems(
                leading: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .bold()
                        .foregroundStyle(Color("wbFont"))
                })
            .padding()
            .background(Color("wbBG"))
    }
}
