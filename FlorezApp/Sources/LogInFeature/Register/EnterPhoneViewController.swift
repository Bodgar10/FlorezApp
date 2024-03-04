//
//  EnterPhoneViewController.swift
//  FlorezApp
//
//  Created by Bodgar Espinosa Miranda on 18/02/24.
//

import UIKit
import FirebaseAuth

class EnterPhoneViewController: UIViewController {

    @IBOutlet weak var lblTitleScreen: CustomLabel!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func nextButtonPressed(_ sender: UIButton) {
        let phone = "+52\(phoneNumberTextField.text ?? "")"
        PhoneAuthProvider.provider()
            .verifyPhoneNumber(phone, uiDelegate: nil) { verificationID, error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print(verificationID)
                }
          }
    }
}
