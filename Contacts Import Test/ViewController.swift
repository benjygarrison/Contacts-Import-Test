//
//  ViewController.swift
//  Contacts Import Test
//
//  Created by Benjamin Garrison on 9/7/19.
//  Copyright © 2019 Benji Garrison. All rights reserved.
//

import UIKit
//import ContactsUI

class ViewController: UITableViewController {
    
    let contacts = ["Ben", "Hana", "Glenn", "Steve"]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = contacts[indexPath.row]
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
        }else {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    
}
