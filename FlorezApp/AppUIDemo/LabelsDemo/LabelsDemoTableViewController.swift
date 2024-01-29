//
//  LabelsDemoTableViewController.swift
//  FlorezApp
//
//  Created by Bodgar Espinosa Miranda on 28/01/24.
//

import UIKit

class LabelsDemoTableViewController: UITableViewController {
        
    var labels: [String] = [
        "Title Label style = 0",
        "Body Label style = 1",
        "Bold Description Label style = 2"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TitleLabelTableViewCell", bundle: nil), forCellReuseIdentifier: "TitleLabelTableViewCell")
        tableView.register(UINib(nibName: "BodyLabelTableViewCell", bundle: nil), forCellReuseIdentifier: "BodyLabelTableViewCell")
        tableView.register(UINib(nibName: "BoldDescriptionLabelTableViewCell", bundle: nil), forCellReuseIdentifier: "BoldDescriptionLabelTableViewCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return labels.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return labels[section]
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleLabelTableViewCell", for: indexPath) as! TitleLabelTableViewCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BodyLabelTableViewCell", for: indexPath) as! BodyLabelTableViewCell
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BoldDescriptionLabelTableViewCell", for: indexPath) as! BoldDescriptionLabelTableViewCell
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
