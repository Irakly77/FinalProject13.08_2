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
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(contacts) { contact in
                    HStack {
                        ContactRow(contact: contact)
                    }
                }
                .onDelete(perform: deleteContact)
            }
        }
    }
        
        private func deleteContact(at offsets: IndexSet) {
            let realm = try! Realm()
            offsets.map { contacts[$0] }.forEach { contact in
                try! realm.write {
                    realm.delete(contact)
                }
            }
        }
        
    
}

struct ContactsListView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsListView()
    }
}
