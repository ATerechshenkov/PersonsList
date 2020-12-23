//
//  PersonModel.swift
//  PersonsList
//
//  Created by Terechshenkov Andrey on 22.12.2020.
//

import Foundation

struct Person {
    var fullName: String {
        firstName + " " + lastName
    }
    
    var firstName: String
    var lastName: String
    var phoneNumber: String
    var email: String
}

class DataNemager {
    static let firstNames: Set<String> = ["Leionard", "Sheldon", "Penny", "Howard", "Raj", "Amy", "Bernadette"]
    static let lastNames: Set<String> = ["Hofstadter", "Cooper", "Wolowitz", "Koothrappali", "Farrah", "Fowler", "Rostenkowski"]
    static let postHosts: Set<String> = ["mail.ru", "icloud.com", "gmail.com", "yandex.ru", "godaddy.com"]
    static var persons = [Person]()
    
    static func getPersons() -> [Person] {
        return persons.isEmpty ? genRandomPersons() : persons
    }
    
    static private func genRandomPersons() -> [Person] {
        var firstNames = DataNemager.firstNames
        var lastNames = DataNemager.lastNames
        
        while !firstNames.isEmpty || !lastNames.isEmpty {
            let lastName = lastNames.popFirst()!
            persons.append(
                Person(
                    firstName: firstNames.popFirst()!,
                    lastName: lastName,
                    phoneNumber: "+" + String(Int.random(in: 1000000000...9999999999)),
                    email: lastName.lowercased() + "@" + postHosts.randomElement()!
                )
            )
        }
        
        return persons
    }
}
