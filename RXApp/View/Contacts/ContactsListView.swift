//
//  ContactsListView.swift
//  RXApp
//
//  Created by Аlina Кovtunovich on 11.08.2024.
//

import SwiftUI
import RealmSwift

struct ContactsListView: View {
    @ObservedResults(Contact.self) var contacts
    var searchText: String
    
    var filteredContacts: Results<Contact> {
        if searchText.isEmpty {
            return contacts
        } else {
            return contacts.filter("name CONTAINS[c] %@", searchText)
        }
    }
    
    var body: some View {
            List(filteredContacts) { contact in
                    NavigationLink(destination: ProfileAccountView(contact: contact)) {
                        ContactRow(contact: contact)
                    }
                    .listRowBackground(Color.clear)
            }
            .scrollContentBackground(.hidden)
    }
}

