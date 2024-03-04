//
//  AdditionalInfoSignInViewController.swift
//  FlorezApp
//
//  Created by Bodgar Espinosa Miranda on 11/02/24.
//

import UIKit

class AdditionalInfoSignInViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        nameTextField.delegate = self
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }

}

extension AdditionalInfoSignInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
