//
//  AvatarView.swift
//  WBApp
//
//  Created by Аlina Кovtunovich on 11.08.2024.
//

import SwiftUI

struct AvatarView: View {
    let contact: Contact
    let localizationAvatar: String
    @StateObject private var imageLoader = ImageLoader()
    
    var body: some View {
        
        switch localizationAvatar {
        case "list":
            if let avatarURL = contact.avatarPath {
                if let image = imageLoader.image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 48, height: 48)
                        .cornerRadius(16)
                        .padding(2)
                        .overlay(StoryOverlay(contact: contact))
                        .overlay(StatusOverlay(contact: contact))
                } else {
                    textAvatar(contact: contact)
                        .onAppear {
                            imageLoader.loadImage(from: URL(string: avatarURL) ?? URL(string: "")!)
                        }
                }
            } else {
                textAvatar(contact: contact)
            }
        case "profile":
            if let avatarURL = contact.avatarPath {
                
                if let image = imageLoader.image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                } else {
                    personNoAvatar()
                        .onAppear {
                            imageLoader.loadImage(from: URL(string: avatarURL) ?? URL(string: "")!)
                        }
                }
            }
            else {
                personNoAvatar()
            }
            
        default:
            VStack {}
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
            .background(Color("avatarColor"))
            .cornerRadius(16)
            .padding(2)
            .overlay(StoryOverlay(contact: contact))
            .overlay(StatusOverlay(contact: contact))
    }
}

struct personNoAvatar: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color("profileDetails"))
                .frame(width: 200, height: 200)
            Image("profile")
                .resizable()
                .scaledToFit()
                .frame(width: 75, height: 89)
        }
    }
}

extension Contact {
    func initials() -> String {
        let firstInitial = String(name.prefix(1))
        let lastInitial = String(surname.prefix(1))
        return firstInitial + lastInitial
    }
}
