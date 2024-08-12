//
//  TabBar.swift
//  WB_APP
//
//  Created by Irakli Chachava on 11.08.2024.
//

import SwiftUI
struct TabBar: View {
    var body: some View {
        TabView {
            ContactsView()
                .tabItem {
                    Image(systemName: "person.2")
                }
//            Chats()
//                .tabItem {
//                    Image(systemName: "message")
//                }
//            Other()
//                .tabItem {
//                    Image(systemName: "ellipsis")
//                }
        }
    }
}


