//
//  ContactsView.swift
//  RXApp
//
//  Created by Аlina Кovtunovich on 12.08.2024.
//

import SwiftUI

struct ContactsView: View {
    @State private var newContact = false // Состояние для управления переходом
    
    var body: some View {
        NavigationStack {
            VStack {
                
                SearchBar() // Здесь должна быть реализация поиска
                ContactsListView() // Вывод списка контактов из базы данных Realm
                    .padding(.leading, 15)
                    .listStyle(.inset)
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Контакты")
                        .font(.system(size:18))
                        .foregroundColor(.black)
                        .padding(.leading,19)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        newContact.toggle() // Переключить состояние при нажатии на кнопку "+"
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                            .padding(.trailing,16)
                    }
                }
            }
            .navigationDestination(isPresented: $newContact) {
                NewContact() // Переход на NewContact для создания нового контакта
            }
        }
    }
}

struct Contacts_Prewiew: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}

