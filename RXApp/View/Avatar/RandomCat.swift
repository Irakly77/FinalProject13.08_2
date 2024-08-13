//
//  RandomCat.swift
//  RXApp
//
//  Created by Аlina Кovtunovich on 13.08.2024.
//

import SwiftUI

struct RandomCat: View {
    @Binding var catURL: URL?
    
    var body: some View {
        if let avatarURL = catURL {
            AsyncImage(url: avatarURL) { image in
                image
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
            } placeholder: {
                Image("Avatar1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 101)
            }
        } else {
            Button(action: {
                fetchCatImage()
            }) {
                Image("Avatar1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 101)
            }
        }
    }
    
    private func fetchCatImage(retries: Int = 3) {
        loadingCats { data, error in
            if let url = data {
                catURL = url
            } else if retries > 0 {
                fetchCatImage(retries: retries - 1)
            } else {
                print("Ошибка загрузки изображения кота: \(String(describing: error))")
            }
        }
    }
    
    func loadingCats(completion: @escaping (_ data: URL?, _ error: Error?) -> Void) {
        CatsAPI.catGet(id: "cat") { data, error in
            completion(data, error)
        }
    }
}

struct RandomCat_Previews: PreviewProvider {
    static var previews: some View {
        RandomCat(catURL: .constant(nil))
    }
}

