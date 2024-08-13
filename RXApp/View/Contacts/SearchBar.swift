//
//  SearchBar.swift
//  WB_APP
//
//  Created by Irakli Chachava on 11.08.2024.
//
import SwiftUI
import Foundation
struct SearchBar: View {
    @Binding var searchText: String
    var body: some View {
        ZStack(alignment: .leading) {
            TextField("Search", text: $searchText)
                .padding(.leading, 30) // Добавляем место для иконки лупы
                .padding(6)
                .foregroundStyle(Color("wbSearchFont"))
                .cornerRadius(4)
                .frame(width: 327, height: 36)
                .background(RoundedRectangle(cornerRadius: 4).fill(Color("wbTint")))
            
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.leading, 8) // Отступ для иконки лупы
        }
    }
}

//#Preview {
//    SearchBar()
//}

