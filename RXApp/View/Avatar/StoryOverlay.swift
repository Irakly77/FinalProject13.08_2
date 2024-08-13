//
//  StoryOverlay.swift
//  WBApp
//
//  Created by Аlina Кovtunovich on 14.06.2024.
//

import SwiftUI

struct StoryOverlay: View {
    let contact: Contact
    
    var body: some View {
        Group {
            if contact.story {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(LinearGradient(gradient: Gradient(colors: [Color("wbAvatar"), Color("secondPoint")]), startPoint: .leading, endPoint: .trailing), lineWidth: 2)
            } else {
                RoundedRectangle(cornerRadius: 0)
                    .stroke(Color.clear, lineWidth: 0)
            }
        }
    }
}

