//
//  CodeViewController.swift
//  FlorezApp
//
//  Created by CinNun on 04/02/24.
//

import UIKit

final class CodeViewController: MainViewController {
    @IBOutlet private weak var firstDigit: CustomTextField!
    @IBOutlet private weak var secondDigit: CustomTextField!
    @IBOutlet private weak var thirdDigit: CustomTextField!
    @IBOutlet private weak var fourthDigit: CustomTextField!
    @IBOutlet private weak var fivethDigit: CustomTextField!
    @IBOutlet private weak var sixthDigit: CustomTextField!
    @IBOutlet private weak var numberSms: UILabel!
    
    var phone = ""
    var viewModel: CodeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defineNavigationDigits()
        
        numberSms.text = phone
        errorBinding()
        successBinding()
    }
    
    private func defineNavigationDigits() {
        firstDigit.setTextFieldsNavigation(nextDigit: secondDigit, previousDigit: nil)
        secondDigit.setTextFieldsNavigation(nextDigit: thirdDigit, previousDigit: firstDigit)
        thirdDigit.setTextFieldsNavigation(nextDigit: fourthDigit, previousDigit: secondDigit)
        fourthDigit.setTextFieldsNavigation(nextDigit: fivethDigit, previousDigit: thirdDigit)
        fivethDigit.setTextFieldsNavigation(nextDigit: sixthDigit, previousDigit: fourthDigit)
        sixthDigit.setTextFieldsNavigation(nextDigit: nil, previousDigit: fivethDigit)
    }
    
    @IBAction private func buttonNext(_ sender: Any) {
        showActivityIndicator()
        let code = "\(firstDigit.text ?? "")\(secondDigit.text ?? "")\(thirdDigit.text ?? "")\(fourthDigit.text ?? "")\(fivethDigit.text ?? "")\(sixthDigit.text ?? "")"
        viewModel?.signIn(verificationCode: code)
    }
    
    @IBAction private func buttonSendCode(_ sender: Any) {
        showActivityIndicator()
        viewModel?.verifyPhone(with: phone)
    }
    
    private func errorBinding() {
        viewModel?.completion = { error in
            if let error {
                self.showAlert(title: "Error", message: error.localizedDescription)
            }
            self.hideActivityIndicator()
        }
    }
    
    private func successBinding() {
        viewModel?.completionSuccess = {
            self.hideActivityIndicator()
            self.showAlert(title: "Código reenviado", message: "Enviamos nuevamente el código de verificación.")
        }
    }
}
