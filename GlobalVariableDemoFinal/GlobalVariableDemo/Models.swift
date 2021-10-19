//
//  Models.swift
//  GlobalVariableDemo
//
//  Created by Su T. Nguyen on 15/09/2021.
//
// 1️⃣ Make models publish changes ✅
// 2️⃣ Create environment singleton ✅
// 3️⃣ Register objects with created singleton ✅
// 4️⃣ Make views handle updates ✅
// 5️⃣ Mark global properties ✅
// 6️⃣ Receive change notifications ✅
//

import Combine
import Foundation

class UserSettings: ObservableObject {

    @Published var isAuthenticated = false

    var desciption: String {
        isAuthenticated ? "Authenticated" : "Anonymous"
    }
}

class AppSettings: ObservableObject {

    @Published var language: Language = .english

    func toggleLanguage() {
        language = language == .english ? .vietnamese : .english
    }

    enum Language: String {
        case vietnamese = "Vietnamese"
        case english = "English"
    }
}

class Environment {

    static let updateChanged = Notification.Name("UpdateCHangedName")

    static let shared = Environment()

    private var cancellableBag = [AnyCancellable]()
    var values = [Any]()

    private init() { }

    func register<T: ObservableObject>(_ value: T) {
        values.append(value)

        value.objectWillChange.sink { _ in
            DispatchQueue.main.async {
                NotificationCenter.default.post(
                    name: Self.updateChanged, object: value
                )
            }
        }
        .store(in: &cancellableBag)
    }
}

protocol GlobalUpdating {

    func update()
}

extension GlobalUpdating {

    func registerForUpdates() {
        let mirror = Mirror(reflecting: self)

        for child in mirror.children {
            if let result = child.value as? AnyGlobal {
                print(child)
                NotificationCenter.default.addObserver(
                    forName: Environment.updateChanged,
                    object: result.anyWrappedValue,
                    queue: .main) { _ in
                    self.update()
                }

            }
        }

        update()
    }
}

@propertyWrapper
struct Global<ObjectType: ObservableObject>: AnyGlobal {

    var wrappedValue: ObjectType
    var anyWrappedValue: Any { wrappedValue }

    init() {
        if let value = Environment.shared.values.first(where: { $0 is ObjectType }) as? ObjectType {
            wrappedValue = value
        } else {
            fatalError("Missing \(ObjectType.self) in environment")
        }
    }
}

protocol AnyGlobal {

    var anyWrappedValue: Any { get }
}
