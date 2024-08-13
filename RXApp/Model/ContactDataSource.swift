//
//  ContactDataSource.swift
//  RXApp
//
//  Created by Аlina Кovtunovich on 11.08.2024.
//

import RealmSwift
import Foundation
import Combine

class ContactDataSource {
    private let realm: Realm
    
    // Загрузка данных из примера при инициализации
    init() {
        realm = try! Realm()
        addSampleData()
    }
    
    func addSampleData() {
        let existingContacts = realm.objects(Contact.self)
        if existingContacts.isEmpty {
            let sampleContacts = [
                Contact(value: ["id": ObjectId.generate(), "name": "Анастасия", "surname": "Иванова", "avatarPath": "https://s3-alpha-sig.figma.com/img/dff3/9826/1c3f407d0c7ff3bc9e52078ef2bbe372?Expires=1724630400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=nBxeAfsPeKvV~HBhJivK-D8yDyBZGlb59bPqyX2QasRo2Bl3UcdyXiii3YoPulfQOEYScmcDa3Hd4df8-NO0G1dGTISwoS-PYVD96ZPXrrBySIU0nG0kl4kq4naLyvnwY0WrdtqpyZKCPA0I3yk4c5IFGPPW-MkbaC-~mDgXJWamZWeTUqrUE72WGplwOcbDUARBZayLZA8unS8~e25Acs8oSj~aAIT1ltu~hvjw3UvgkuaBKVypIYu~T3U53Eje4ZTN6I2RT9Nqmv5WwpCe-OewFEjZtjM10HrYEMdiNlODNDESFOJCpu42sIR910SEa55zogIYiq0OheLBdUyoTw__", "status": false, "story": false, "lastOnline": Date(timeIntervalSinceNow: -86400)]),
                Contact(value: ["id": ObjectId.generate(), "name": "Петя", "surname": "", "avatarPath": "https://s3-alpha-sig.figma.com/img/1fc2/0c81/2121f46e84fc081ac2db4ad8a1450beb?Expires=1724630400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=bnGrEoAZn~pCl1KFkhhtGhZt0xYSRQlpHHXQGuz5R-CKnWYk5Caa23XTf5AJQq7icFPoTXs2UHk381lk~KCRgwKnfWLFVIh21SMP8i88U~7dGS5y2GT2tjN00Xo3ePf7xOFcTg~ai1bRoEVSZRNBjUlW-O7hrykJPGaQzJx0TQ23nR0e4ci6lt3yljA46wQuS8gjQP7E9DuC18XlLi76k6hrKtV7QFZHATxCQOz4o4UlMCeG1w8NRP6NwaW6V329-y5VbFh1ugGyklizpaAx7Ds1ZGKDDBExwwIPxZC3SAr5lYZnObJCbJ3IWGaI3SMMXT6kLQAE8l4B5TxZCXRuDg__", "status": true, "story": true]),
                Contact(value: ["id": ObjectId.generate(), "name": "Маман", "surname": "", "avatarPath": "https://s3-alpha-sig.figma.com/img/fed1/a269/a70ee65e1cab2c63136a619f1b00e1fe?Expires=1724630400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=hZvOe~YdRisMttz0UVczGTKrw6ScL~qy0m1-7w~QyiIMWpXeSmwUgkuHwwo7CQ-V3Krov6JN6THNASe9CrvdP9HIzDGNYYRJLsZmk9PzE-WWWtWHLQQUimylALAE4QkBQip1AGcR~oEmcoE9~UdP00a-xJuqZGUAv4GJFhMuiws71UhmHlUX1KGcT~64tlWi79viyQEc8zTGAXTcq1TdhS3z5J78wfRbIZ-jJcW8LEveE6D8KfO1WgY65JPN7FnCp~xeOfCGuM3qvj75USTBxtVrpJ~TFUJW9vNqZASzTJl2-5Zgp41AD-Bo03QLsNBjOqNfnyxJmxqGaKgkDhX3hQ__", "status": false, "story": true, "lastOnline": Date(timeIntervalSinceNow: -10800)]),
                Contact(value: ["id": ObjectId.generate(), "name": "Арбуз", "surname": "Дыня", "avatarPath": "https://s3-alpha-sig.figma.com/img/8ab4/9616/2c4ab2e6878b848cf34cec5937b90ffb?Expires=1724630400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=fv0F7Y3BSHMpPu9GuW5eKfhn2CPibJWjuA7KdBCAAJ9lP6VoXrKVWshg6GtUrAln1CkjDhmFH~RzbH5fwzqnKCPhevblRP4Rf~YvwKfv9RvEBFXzqqg0lhkSHyKXX-iI1tVjJaGKHE0Qc3718EZzvoNTJCfDxe-m9Mi~0F~CQ9O4FJgotjho1HxVgHk96aYyHYsFDeX6rppLyBhkXc~7aC-dE21Qf1Z~8ga2k01SFjxDfD9lb~zb~4Znni~yu1HeQJVB-uG7LAwVK774vRiGJ5at1~yyV49GdbsIzbeNNbNWrGxoBFQraXE052vXAQp5zXPTsllbk-BCQ0AXbrCCmA__", "status": true, "story": false]),
                Contact(value: ["id": ObjectId.generate(), "name": "Иван", "surname": "Иванов", "status": true, "story": false]),
                Contact(value: ["id": ObjectId.generate(), "name": "Лиса", "surname": "Алиса", "status": false, "story": true, "lastOnline": Date(timeIntervalSinceNow: -1800)])
            ]
            
            try! realm.write {
                realm.add(sampleContacts)
            }
        }
    }
    
    func createContact(_ contact: Contact) throws {
        do {
            try realm.write {
                realm.add(contact)
            }
        } catch {
            print("Ошибка при создании контакта: \(error.localizedDescription)")
            throw error
        }
    }
    
    func readContacts() -> Results<Contact> {
        return realm.objects(Contact.self)
    }
    
    func updateContact(_ contact: Contact, with newName: String) throws {
        do {
            try realm.write {
                contact.name = newName
            }
        } catch {
            print("Ошибка при обновлении контакта: \(error.localizedDescription)")
            throw error
        }
    }
    
    func deleteContact(_ contact: Contact) throws {
        do {
            try realm.write {
                realm.delete(contact)
            }
        } catch {
            print("Ошибка при удалении контакта: \(error.localizedDescription)")
            throw error
        }
    }
    
    func searchContact(by name: String) -> Results<Contact> {
        return realm.objects(Contact.self).filter("name CONTAINS[c] %@", name)
    }
    
    func observeContacts() -> AnyPublisher<[Contact], Error> {
        let contacts = realm.objects(Contact.self)
        return contacts.collectionPublisher
            .map { Array($0) }
            .eraseToAnyPublisher()
    }
}
