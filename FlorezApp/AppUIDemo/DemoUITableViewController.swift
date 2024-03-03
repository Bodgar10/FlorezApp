//
//  DemoUITableViewController.swift
//  FlorezApp
//
//  Created by Bodgar Espinosa Miranda on 21/01/24.
//

import UIKit

enum DemoSection {
    case components
    case logInFeature
    
    var nameSection: String {
        switch self {
        case .components:
            return "Components"
        case .logInFeature:
            return "LogIn Feature"
        }
    }
}

enum DemoView {
    /// Enum to show only the UI Components (ej. Buttons, Labels, TableViews).
    case buttons
    case labels
    case textFields
    
    /// Enum to show only the features
    ///
    /// LogInFeature
    case homeScreenViewController
    case codeViewController
    
    
    /// FeedFeature
    ///
    ///
    ///
    
    var nameView: String {
        switch self {
        case .buttons:
            return "Buttons"
        case .labels:
            return "Labels"
        case .textFields:
            return "TextFields"
        case .homeScreenViewController:
            return "HomeScreenViewController"
        case .codeViewController:
            return "CodeViewController"
        }
    }
    
    var viewController: UIViewController {
        switch self {
        case .buttons:
            return DemoButtonsTableViewController()
        case .labels:
            return LabelsDemoTableViewController()
        case .textFields:
            return DemoTextFieldsTableViewController()
        case .homeScreenViewController:
            return HomeScreenViewController()
        case .codeViewController:
            return CodeViewController()
        }
    }
    
    var nameNav: String {
        switch self {
        case .textFields:
            return ""
        case .buttons:
            return ""
        case .labels:
            return ""
        case .homeScreenViewController:
            return "Inicio"
        case .codeViewController:
            return "Registrate"
        }
    }
}

class DemoUITableViewController: UITableViewController {
    typealias DemoList = (section: DemoSection, views: [DemoView])
    
    private var demoViews = [DemoList]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Components Demo
        demoViews.append(
            (.components, 
             [
                .buttons,
                .labels,
                .textFields
             ]
            )
        )
        
        /// LogInFeature Demo
        demoViews.append(
            (.logInFeature, 
             [
                .homeScreenViewController,
                .codeViewController
             ]
            )
        )
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return demoViews.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demoViews[section].views.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return demoViews[section].section.nameSection
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var config = cell.defaultContentConfiguration()
        config.text = demoViews[indexPath.section].views[indexPath.row].nameView
        cell.contentConfiguration = config
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = demoViews[indexPath.section].views[indexPath.row].viewController
        navigationController?.pushViewController(viewController, animated: true)
    }
}
