//
//  Models.swift
//  GlobalVariableDemo
//
//  Created by Su T. Nguyen on 15/09/2021.
//
// 1️⃣ Make models publish changes
// 2️⃣ Create environment singleton
// 3️⃣ Register objects with created singleton
// 4️⃣ Make views handle updates
// 5️⃣ Mark global properties
// 6️⃣ Receive change notifications
//

import Foundation

class UserSettings {

    var isAuthenticated = false

    var desciption: String {
        isAuthenticated ? "Authenticated" : "Anonymous"
    }
}

class AppSettings {

    var language: Language = .english

    func toggleLanguage() {
        language = language == .english ? .vietnamese : .english
    }

    enum Language: String {
        case vietnamese = "Vietnamese"
        case english = "English"
    }
}
