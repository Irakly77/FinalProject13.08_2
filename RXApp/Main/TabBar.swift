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
    
    var body: some View {
        TabView() {
            ContactsView().tabItem {
                Image(internalSelectedTab != .user ? "user" : "userselected")
            }.tag(Tabs.user)
            ViewRandomCat().tabItem {
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

