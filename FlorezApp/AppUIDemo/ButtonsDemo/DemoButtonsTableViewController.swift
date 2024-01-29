//
//  DemoButtonsTableViewController.swift
//  FlorezApp
//
//  Created by Bodgar Espinosa Miranda on 21/01/24.
//

import UIKit

class DemoButtonsTableViewController: UITableViewController {
    
    var buttons: [String] = [
        "Primary Button style = 0",
        "Secondary Button style = 1"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "ButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "ButtonTableViewCell")
        tableView.register(UINib(nibName: "SecondaryButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "SecondaryButtonTableViewCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return buttons.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return buttons[section]
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonTableViewCell", for: indexPath) as! ButtonTableViewCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SecondaryButtonTableViewCell", for: indexPath) as! SecondaryButtonTableViewCell
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
