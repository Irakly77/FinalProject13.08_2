//
//  StatusOverlay.swift
//  WBApp
//
//  Created by Аlina Кovtunovich on 14.06.2024.
//

import SwiftUI

struct StatusOverlay: View {
    let contact: Contact
    
    var body: some View {
        Circle()
            .fill(contact.status ? Color.green : Color.clear)
            .frame(width: 12, height: 12)
        
            .offset(x: 20, y: -20)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(contact.status ? .white : .clear, lineWidth: 2)
                    .offset(x: 20, y: -20)
            )
    }
}
