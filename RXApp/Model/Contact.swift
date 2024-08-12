//
//  Contact.swift
//  RXApp
//
//  Created by Аlina Кovtunovich on 11.08.2024.
//

import Foundation
import RealmSwift

class Contact: Object, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String = ""
    @Persisted var surname: String = ""
    @Persisted var avatarPath: String? = nil
    @Persisted var status: Bool = false
    @Persisted var story: Bool = false
    @Persisted var lastOnline: Date? = nil
}
