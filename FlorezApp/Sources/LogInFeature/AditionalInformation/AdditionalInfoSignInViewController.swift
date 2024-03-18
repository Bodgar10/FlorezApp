//
//  AdditionalInfoSignInViewController.swift
//  FlorezApp
//
//  Created by Bodgar Espinosa Miranda on 11/02/24.
//

import UIKit

class AdditionalInfoSignInViewController: MainViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
    }

}

extension AdditionalInfoSignInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
