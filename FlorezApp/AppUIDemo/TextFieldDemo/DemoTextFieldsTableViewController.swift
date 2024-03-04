//
//  DemoTextFieldsTableViewController.swift
//  FlorezApp
//
//  Created by CinNun on 04/02/24.
//

import UIKit

class DemoTextFieldsTableViewController: UITableViewController {
        
    var textFields: [String] = [
        "Digit style = 0",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TextFieldDigitTableViewCell", bundle: nil), forCellReuseIdentifier: "TextFieldDigitTableViewCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return textFields.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return textFields[section]
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldDigitTableViewCell", for: indexPath) as? TextFieldDigitTableViewCell {
                return cell
            }
            return UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
