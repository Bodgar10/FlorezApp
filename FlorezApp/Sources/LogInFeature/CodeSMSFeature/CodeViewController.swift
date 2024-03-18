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
        fivethDigit.setTextFieldsNavigation(nextDigit: nil, previousDigit: firstDigit)
    }
    
    @IBAction private func buttonNext(_ sender: Any) {
    }
    
    @IBAction private func buttonSendCode(_ sender: Any) {
        viewModel?.verifyPhone(with: phone)
    }
    
    private func errorBinding() {
        viewModel?.completion = { error in
            self.showAlert(title: "Error", message: error.localizedDescription)
        }
    }
    
    private func successBinding() {
        viewModel?.completionSuccess = {
            self.showAlert(title: "Código reenviado", message: "Enviamos nuevamente el código de verificación.")
        }
    }
}
