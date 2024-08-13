//
//  NumberView.swift
//  RXApp
//
//  Created by Ульяна Евстигнеева on 12.08.2024.
//

import SwiftUI
import Foundation

struct NumberView: View {

    @Binding var number: String
    var body: some View {
        HStack(spacing: 8) {
            
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .foregroundColor(Color("wbTint"))
                    .frame(width: 57, height: 36)
                HStack {
                    Image("flag")
                        .cornerRadius(4)
                    Text("+7")
                        .foregroundColor(Color("wbSearchFont"))
                        .font(.system(size: 16))
                }
            }
            TextField("000 000-00-00", text: $number)
                .keyboardType(.numberPad)
                .padding(7)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color("wbTint"))
                )
                .onChange(of: number) { newValue in
                    let formatted = formatPhoneNumber(newValue)
                    if number != formatted {
                        number = formatted
                    }
                }
        }
        .bold()
        .foregroundStyle(.gray)
    }

    func formatPhoneNumber(_ number: String) -> String {
        let digits = number.filter { $0.isNumber }

        let mask = "XXX XXX-XX-XX"
        var result = ""
        var index = digits.startIndex

        for ch in mask where index < digits.endIndex {
            if ch == "X" {
                result.append(digits[index])
                index = digits.index(after: index)
            } else {
                result.append(ch)
            }
        }

        return result
    }
}
