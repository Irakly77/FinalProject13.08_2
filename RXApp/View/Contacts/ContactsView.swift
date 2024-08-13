//
//  ContactsView.swift
//  RXApp
//
//  Created by Аlina Кovtunovich on 12.08.2024.
//
import SwiftUI

struct ContactsView: View {
    @State private var newContact = false // Состояние для управления переходом
    @State var path = [Contact]()
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                
                SearchBar(searchText: $searchText)
                ContactsListView(searchText: searchText) // Вывод списка контактов из базы данных Realm
                    .padding(.leading, 15)
                    .listStyle(.inset)
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Contacts")
                        .font(.system(size:18))
                        .foregroundStyle(Color("wbFont"))
                        .bold()
                        .padding(.leading,19)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        newContact.toggle() // Переключить состояние при нажатии на кнопку "+"
                    }) {
                        Image(systemName: "plus")
                            .foregroundStyle(Color("wbFont"))
                            .bold()
                            .padding(.trailing,16)
                    }
                }
            }
            .navigationDestination(isPresented: $newContact) {
                NewContact() // Переход на NewContact для создания нового контакта
            }
            .background(Color("wbBG"))
        }
    }
}

struct Contacts_Prewiew: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}
//
//#Preview {
//    ContactsView()
//}
