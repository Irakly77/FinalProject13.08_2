//
//  NewContact.swift
//  RXApp
//
//  Created by Аlina Кovtunovich on 12.08.2024.
//

import SwiftUI
import RealmSwift
import APICats

struct NewContact: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var name: String = ""
    @State private var surname: String = ""
    @State private var flag: String = ""
    @State private var number: String = ""
    @State private var twitter: String = ""
    @State private var instagram: String = ""
    @State private var linkedin: String = ""
    @State private var facebook: String = ""
    
    @State private var avatarURL: URL? // Переменная состояния для хранения URL загруженного изображения кота.
    
    var body: some View {
        VStack {
            
            if let avatarURL = avatarURL {
                // Отображение загруженного изображения кота
                AsyncImage(url: avatarURL) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 56, height: 56)
                        .cornerRadius(16)
                } placeholder: {
                    Image("Avatar1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 101)
                }
            } else {
                // Отображение аватара по умолчанию
                Button(action: {
                    fetchCatImage() // Загрузка изображения кота при нажатии на аватар
                }) {
                    Image("Avatar1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 101)
                }
            }
            
            Group {
                createTextField(placeholder: "Имя (обязательно)", text: $name)
                createTextField(placeholder: "Фамилия (опционально)", text: $surname)
                createEmailField()
                createTextField(placeholder: "twitter", text: $twitter)
                createTextField(placeholder: "@instagram", text: $instagram)
                createTextField(placeholder: "linkedin", text: $linkedin)
                createTextField(placeholder: "facebook/profile", text: $facebook)
            }
            .padding(.bottom, 32)
            
            Button(action: {
                saveContact()
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Сохранить контакт")
                    .frame(width: 200, height: 40)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "arrow.left")
                        Text("Новый контакт")
                    }
                }
                .foregroundColor(.black)
            }
        }
    }
    
    private func createTextField(placeholder: String, text: Binding<String>) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .fill(Color(red: 247/255, green: 247/255, blue: 252/255))
                .frame(width: 327, height: 36)
            HStack {
                TextField(placeholder, text: text)
                    .foregroundColor(.black)
                    .padding(.horizontal, 40)
                Spacer()
            }
        }
    }
    
    private func createEmailField() -> some View {
        HStack {
            TextField("🇷🇺+7", text: $flag)
                .foregroundColor(.black)
                .padding(.horizontal, 3)
                .frame(width: 57, height: 36)
                .background(RoundedRectangle(cornerRadius: 4).fill(Color(red: 247/255, green: 247/255, blue: 252/255)))
            TextField("000 000-00-00", text: $number)
                .foregroundColor(.black)
                .padding(.horizontal, 8)
                .frame(width: 262, height: 36)
                .background(RoundedRectangle(cornerRadius: 4).fill(Color(red: 247/255, green: 247/255, blue: 252/255)))
        }
        .frame(width: 327, height: 36)
    }
    
    private func saveContact() {
        let realm = try! Realm()
        let contact = Contact()
        contact.name = name
        contact.surname = surname
        contact.avatarPath = avatarURL?.absoluteString ?? "Avatar1"
//        contact.flag = flag
        contact.number = number
        contact.twitter = twitter
        contact.instagram = instagram
        contact.linkedin = linkedin
        contact.facebook = facebook
        
        try! realm.write {
            realm.add(contact)
        }
    }
    
    private func fetchCatImage(retries: Int = 3) {
        loadingCats { data, error in
            if let url = data {
                avatarURL = url
            } else if retries > 0 {
                // Если произошла ошибка, и количество попыток больше нуля, пробуем еще раз
                fetchCatImage(retries: retries - 1)
            } else {
                // Обработка ошибки после всех попыток
                print("Ошибка загрузки изображения кота: \(String(describing: error))")
                // Можно добавить сообщение для пользователя или оставить стандартный аватар
            }
        }
    }
    
    func loadingCats(completion: @escaping (_ data: URL?, _ error: Error?) -> Void) {
        CatsAPI.catGet(id: "cat") { data, error in
            completion(data, error)
        }
    }
}

struct NewContact_Previews: PreviewProvider {
    static var previews: some View {
        NewContact()
    }
}
