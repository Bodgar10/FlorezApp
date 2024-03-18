//
//  EnterPhoneViewController.swift
//  FlorezApp
//
//  Created by Bodgar Espinosa Miranda on 18/02/24.
//

import UIKit
import FirebaseAuth

class EnterPhoneViewController: MainViewController {

    @IBOutlet weak var lblTitleScreen: CustomLabel!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    lazy var viewModel = PhoneViewModel(navigation: navigationController)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorBinding()
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        viewModel.verifyPhone(with: phoneNumberTextField.text)
    }
    
    private func errorBinding() {
        viewModel.completion = { error in
            self.showAlert(title: "Error", message: error.localizedDescription)
        }
    }
}
