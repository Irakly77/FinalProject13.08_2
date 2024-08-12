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
                if let avatarPath = contact.avatarPath, let url = URL(string: avatarPath) {
                    ZStack {
                        if let image = imageLoader.image {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                        } else {
                            ProgressView()
                                .frame(width: 50, height: 50)
                                .onAppear {
                                    imageLoader.loadImage(from: url)
                                }
                        }
                    }
                } else {
                    textAvatar(contact: contact)
                }
                VStack(alignment: .leading) {
                    Text(contact.name)
                    Text(contact.surname)
                }
            }
        } else {
            Text("Contact is invalid")
        }
    }
}


struct textAvatar: View {
    let contact: Contact
    
    var body: some View {
        Text(contact.initials())
            .foregroundColor(.white)
            .font(.system(size: 14, weight: .bold))
            .frame(width: 48, height: 48)
            .background(Color(.purple))
            .cornerRadius(16)
            .padding(2)
//            .overlay(StoryOverlay(contact: contact))
//            .overlay(StatusOverlay(contact: contact))
    }
}

extension Contact {
    func initials() -> String {
        let firstInitial = String(name.prefix(1))
        let lastInitial = String(surname.prefix(1))
        return firstInitial + lastInitial
    }
}

