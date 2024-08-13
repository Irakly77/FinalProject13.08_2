//
//  CodeView.swift
//  RXApp
//
//  Created by Ульяна Евстигнеева on 12.08.2024.
//


import SwiftUI
import UISystem

struct CodeView: View {
    let code: String
    @Binding var enteredCode: String
    @Binding var isFullScreenPresented: Bool
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        ZStack {
            HStack(spacing: 15) {
                ForEach(Array(enteredCode), id: \.self) { digit in
                    HeadlineTitleView(headlineFont: Color("wbFont"), title: String(digit))
                }
                
                ForEach(0..<(4 - enteredCode.count), id: \.self) { _ in
                    Circle()
                        .foregroundStyle(Color("wbTint"))
                        .frame(width: 24, height: 24)
                }
            }
            TextField("", text: $enteredCode)
                .focused($isTextFieldFocused)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                        self.isTextFieldFocused = true
                    }
                }
                .keyboardType(.numberPad)
                .opacity(0)
                .onChange(of: enteredCode) { newValue in
                    _ = formatCode(newValue)
                    if newValue.count > 4 {
                        enteredCode = String(newValue.prefix(4))
                    }
                    if enteredCode.count == 4 && code == enteredCode {
                        isFullScreenPresented.toggle()
                    }
                    if enteredCode.count == 4 && code != enteredCode {
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            enteredCode = ""
                        }
                    }
                }
        }
    }
}

func formatCode(_ number: String) -> String {
    let digits = number.filter { $0.isNumber }
    return String(digits.prefix(min(4, digits.count)))
}
