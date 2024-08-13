//
//  ContentView.swift
//  RXApp
//
//  Created by Аlina Кovtunovich on 11.08.2024.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var viewModel = ContactsViewModel()
    
    var body: some View {
        WalkthroughView()
            .onAppear {
                viewModel.loadContacts()
            }
    }
}



//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

