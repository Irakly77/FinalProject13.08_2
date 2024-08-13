//
//  NewContact.swift
//  RXApp
//
//  Created by Аlina Кovtunovich on 12.08.2024.
//

import SwiftUI
import RealmSwift
import APICats
import UISystem

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
            
            RandomCat(catURL: $avatarURL)
                            .frame(width: 100, height: 100)
            Spacer()
            
            Group {
                createTextField(placeholder: NSLocalizedString("Name(Necessarily)", comment: ""), text: $name)
                createTextField(placeholder: NSLocalizedString("Surname(Optional)",comment: ""), text: $surname)
                createEmailField()
                createTextField(placeholder: "twitter", text: $twitter)
                createTextField(placeholder: "@instagram", text: $instagram)
                createTextField(placeholder: "linkedin", text: $linkedin)
                createTextField(placeholder: "facebook/profile", text: $facebook)
                
            }
            .padding(.bottom, 25)
            ButtonWBView(title: "Save contact", action: {
                saveContact()
                presentationMode.wrappedValue.dismiss()
            }, buttonColor: Color("wbButton"))
        }
        .background(Color("wbBG"))
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "arrow.left")
                        Text("New Contact")
                    }
                }
                .bold()
                .foregroundStyle(Color("wbFont"))
            }
        }
    }
    
    private func createTextField(placeholder: String, text: Binding<String>) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .fill(Color("wbTint"))
                .frame(width: 327, height: 36)
            HStack {
                TextField(placeholder, text: text)
                    .foregroundStyle(Color("wbSearchFont"))
                    .padding(.horizontal, 40)
                Spacer()
            }
        }
    }
    
    private func createEmailField() -> some View {
        HStack {
            TextField("🇷🇺+7", text: $flag)
                .foregroundStyle(Color("wbSearchFont"))
                .padding(.horizontal, 3)
                .frame(width: 57, height: 36)
                .background(RoundedRectangle(cornerRadius: 4).fill(Color("wbTint")))
            TextField("000 000-00-00", text: $number)
                .foregroundStyle(Color("wbSearchFont"))
                .padding(.horizontal, 8)
                .frame(width: 262, height: 36)
                .background(RoundedRectangle(cornerRadius: 4).fill(Color("wbTint")))
        }
        .frame(width: 327, height: 36)
    }
    
    private func saveContact() {
        let realm = try! Realm()
        let contact = Contact()
        contact.name = name
        contact.surname = surname
        contact.avatarPath = avatarURL?.absoluteString ?? nil
        
        try! realm.write {
            realm.add(contact)
        }
    }
    
}

struct NewContact_Previews: PreviewProvider {
    static var previews: some View {
        NewContact()
    }
}
