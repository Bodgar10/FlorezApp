//
//  CustomTextField.swift
//  FlorezApp
//
//  Created by CinNun on 04/02/24.
//

import Foundation
import UIKit

class CustomTextField: UITextField {
    @IBOutlet weak var nextDigit: CustomTextField?
    @IBOutlet weak var previousDigit: CustomTextField?
    private var maxLength = 500
    enum TextFieldStyle: Int {
        case digits = 0
    }
    
    @IBInspectable var style : Int = 0 {
        didSet {
            let buttonStyle = TextFieldStyle(rawValue: style) ?? .digits
            set(buttonStyle)
        }
    }
    
    override init(frame: CGRect) {
       super.init(frame: frame)
       commonInit()
    }
       
   required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
       commonInit()
   }
   
   private func commonInit() {
       self.delegate = self
   }
    
    private func set(_ style: TextFieldStyle) {
        switch style {
        case .digits: configDigitsTextField()
        }
    }
    
    private func configDigitsTextField() {
        layer.borderColor = UIColor.dsPrimary.cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 5.0
        self.maxLength = 1
    }
    
    func setTextFieldsNavigation(nextDigit: CustomTextField?, previousDigit: CustomTextField?) {
        if(style == 0) {
            self.nextDigit = nextDigit
            self.previousDigit = previousDigit
        }
    }
}

extension CustomTextField: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (style == 0) {
            textField.text = ""
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if (style == 0) {
            let currentText = self.text ?? ""
            let allowedCharacters = CharacterSet.decimalDigits
            let characterSet = CharacterSet(charactersIn: string)
            
            if allowedCharacters.isSuperset(of: characterSet) {
                if currentText.count == 1 && !(textField.text?.isEmpty ?? true) {
                    nextDigit?.becomeFirstResponder()
                }
            } else {
                if string == "" {
                    return true
                }
                return false
            }
            
            let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
            return newText.count <= self.maxLength
        }
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        previousDigit?.becomeFirstResponder()
        return true
    }
}
