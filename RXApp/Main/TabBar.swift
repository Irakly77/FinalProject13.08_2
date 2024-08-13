//
//  TabBar.swift
//  WB_APP
//
//  Created by Irakli Chachava on 11.08.2024.
//

import SwiftUI

enum Tabs: Hashable {
    case user
    case cat
}


struct TabBar: View {
    @State private var internalSelectedTab: Tabs = .user
    private var selectedTab: Binding<Tabs> {
        Binding(
            get: {
                .user
            },
            set: {
                self.internalSelectedTab = $0
            }
        )
    }
    
    var body: some View {
        TabView(selection: selectedTab) {
            ContactsView().tabItem {
                Image(internalSelectedTab != .user ? "user" : "userselected")
            }.tag(Tabs.user)
            RandomCat(catURL: .constant(nil)).tabItem {
                Image(internalSelectedTab != .cat ? "cat" : "catSelected")
            }.tag(Tabs.cat)
        }
    }
}


struct TabBar_Preview: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

