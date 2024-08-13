//
//  PersonNoAvatar.swift
//  RXApp
//
//  Created by Аlina Кovtunovich on 11.08.2024.
//

import SwiftUI

struct PersonNoAvatar: View {
    var body: some View {
        ZStack {
            
            Circle()
                .fill(Color("wbProfileDetails"))
                .frame(width: 200, height: 200)
            Image("profile")
                .resizable()
                .scaledToFit()
                .frame(width: 75, height: 89)
            
        }
    }
}


struct personNoAvatar_Previews: PreviewProvider {
    static var previews: some View {
        PersonNoAvatar()
    }
}
