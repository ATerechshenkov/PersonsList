//
//  PersonTableViewController.swift
//  PersonsList
//
//  Created by Terechshenkov Andrey on 22.12.2020.
//

import UIKit

class PersonTableViewController: UITableViewController {
    
    var persons = DataNemager.getPersons()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)

        cell.textLabel?.text = persons[indexPath.row].fullName

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "detailSegue" else { return }
        
        let indexPath = tableView.indexPathForSelectedRow!
        let navigationVC = segue.destination as! UINavigationController
        let detailPersonVC = navigationVC.topViewController as! DetailViewController
        detailPersonVC.person = persons[indexPath.row]
    }
    
    @IBAction func unwindSeque(seque: UIStoryboardSegue) {
    }

}
