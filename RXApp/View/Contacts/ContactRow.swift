//
//  ContactRow.swift
//  RXApp
//
//  Created by Аlina Кovtunovich on 11.08.2024.
//

import SwiftUI

struct ContactRow: View {
    let contact: Contact
    @StateObject private var imageLoader = ImageLoader()

    var body: some View {
        if !contact.isInvalidated {
            HStack {
                AvatarView(contact: contact, localizationAvatar: "list")
                VStack(alignment: .leading) {
                    Text("\(contact.name) \(contact.surname)")
                        .bold().font(.system(size: 14))
                        .padding(.vertical, 1)
                    Text(contact.status ? "Online" : contact.lastOnline?.lastOnlineAgo() ?? "")
                        .font(.system(size: 12))
                        .foregroundColor(Color.gray)
                }
            }
            .background(.clear)
        } else {
            Text("Contact is invalid")
        }
    }
}

extension Date {
    func lastOnlineAgo() -> String {
        let secondsAgo = Int(Date().timeIntervalSince(self))
        switch secondsAgo {
        case 0...3600:
            let minute = secondsAgo / 60
            return "Last seen \(minute) minute\(minute == 1 ? "" : "s") ago"
        default:
            let hours = secondsAgo / 3600
            return "Last seen \(hours) hour\(hours == 1 ? "" : "s") ago"
        }
    }
}
