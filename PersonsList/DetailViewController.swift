//
//  DetailViewController.swift
//  PersonsList
//
//  Created by Terechshenkov Andrey on 22.12.2020.
//

import UIKit

class DetailViewController: UIViewController {
    
    var person = Person(firstName: "firstName", lastName: "lastName", phoneNumber: "phoneNumber", email: "email")
    
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = person.fullName
        phoneLabel.text = person.phoneNumber
        emailLabel.text = person.email
    }
    
}
