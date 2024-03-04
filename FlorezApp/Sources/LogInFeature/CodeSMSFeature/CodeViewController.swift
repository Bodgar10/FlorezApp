//
//  CodeViewController.swift
//  FlorezApp
//
//  Created by CinNun on 04/02/24.
//

import UIKit

class CodeViewController: UIViewController {
    @IBOutlet weak var firstDigit: CustomTextField!
    @IBOutlet weak var secondDigit: CustomTextField!
    @IBOutlet weak var thirdDigit: CustomTextField!
    @IBOutlet weak var fourthDigit: CustomTextField!
    @IBOutlet weak var fivethDigit: CustomTextField!
    @IBOutlet weak var numberSms: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
             view.addGestureRecognizer(tapGesture)
        defineNavigationDigits()
    }
    
    private func defineNavigationDigits() {
        firstDigit.setTextFieldsNavigation(nextDigit: secondDigit, previousDigit: nil)
        secondDigit.setTextFieldsNavigation(nextDigit: thirdDigit, previousDigit: firstDigit)
        thirdDigit.setTextFieldsNavigation(nextDigit: fourthDigit, previousDigit: secondDigit)
        fourthDigit.setTextFieldsNavigation(nextDigit: fivethDigit, previousDigit: thirdDigit)
        fivethDigit.setTextFieldsNavigation(nextDigit: nil, previousDigit: firstDigit)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func buttonNext(_ sender: Any) {
    }
    
    @IBAction func buttonSendCode(_ sender: Any) {
    }
}
