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
    
    var viewModel = PhoneViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.completion = { error in
            print(error.localizedDescription)
        }
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        let phone = "+52\(phoneNumberTextField.text ?? "")"
        viewModel.verifyPhone(with: phone)
    }
}
