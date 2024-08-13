//
//  SwiftUIView.swift
//  RXApp
//
//  Created by Ульяна Евстигнеева on 13.08.2024.
//
import SwiftUI
import UISystem

struct ViewRandomCat: View {
    @State var catURL: URL?
    
    var body: some View {
        VStack {
            if let cat = catURL {
                AsyncImage(url: cat) { image in
                    image
                        .resizable()
                        .frame(width: 262, height: 271)
                        .padding(.top, 135)
                } placeholder: {
                    Image("Cat")
                        .resizable()
                        .frame(width: 262, height: 271)
                        .padding(.top, 135)
                }
            } else {
                Image("Cat")
                    .resizable()
                    .frame(width: 262, height: 271)
                    .padding(.top, 135)
            }
            
            HeadlineTitleView(headlineFont: Color("wbFont"), title: "Take a break from work chats and watch cats")
                .padding(.top, 42)
            
            Spacer()
            
            ButtonWBView(title: "The Other Cat", action: {fetchCatImage()}, buttonColor: Color("wbButton"))
        }
        .background(Color("wbBG"))
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

struct ViewRandomCat_Previews: PreviewProvider {
    static var previews: some View {
        ViewRandomCat()
    }
}
