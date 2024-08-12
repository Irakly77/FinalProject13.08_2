//
//  ContactsViewModel.swift
//  RXApp
//
//  Created by Аlina Кovtunovich on 11.08.2024.
//

import Foundation
import RealmSwift
import Combine


class ContactsViewModel: ObservableObject {
    @Published var contacts: [Contact] = []
    private let dataSource = ContactDataSource()
    private var cancellables: Set<AnyCancellable> = []
    
    func loadContacts() {
        dataSource.observeContacts()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { completion in
                    if case .failure(let error) = completion {
                        print("Ошибка при загрузке контактов: \(error.localizedDescription)")
                    }
                },
                receiveValue: { [weak self] contacts in
                    self?.contacts = contacts
                }
            )
            .store(in: &cancellables)
    }
    
    // оставить, если захотим удалять контакты
    func deleteFirstContact() {
        if let firstContact = contacts.first {
            do {
                try dataSource.deleteContact(firstContact)
            } catch {
                print("Ошибка при удалении контакта: \(error.localizedDescription)")
            }
        }
    }
    
    // оставить, если будем изменять существующие контакты
    func updateFirstContactName(to newName: String) {
        if let firstContact = contacts.first {
            do {
                try dataSource.updateContact(firstContact, with: newName)
            } catch {
                print("Ошибка при обновлении контакта: \(error.localizedDescription)")
            }
        }
    }
    
    // реализовать поиск 
    func searchContact(by name: String) {
        let searchResults = dataSource.searchContact(by: name)
        print(searchResults)
    }
}
