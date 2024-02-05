//
//  CustomTextField.swift
//  FlorezApp
//
//  Created by CinNun on 04/02/24.
//

import Foundation
import UIKit

class CustomTextField: UITextField, UITextFieldDelegate {
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
        if let borderColor = UIColor(named: "DSPrimary") {
            layer.borderColor = borderColor.cgColor
        }
        layer.borderWidth = 1.0
        layer.cornerRadius = 5.0
        self.maxLength = 1
    }
    
   func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       let currentText = self.text ?? ""
       let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
       return newText.count <= self.maxLength
   }
}
