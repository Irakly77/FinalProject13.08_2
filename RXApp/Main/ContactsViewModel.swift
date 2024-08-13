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
}
