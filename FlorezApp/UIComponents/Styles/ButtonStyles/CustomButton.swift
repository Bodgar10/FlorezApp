//
//  PrimaryButton.swift
//  FlorezApp
//
//  Created by Bodgar Espinosa Miranda on 21/01/24.
//

import UIKit

class CustomButton: UIButton {

    enum ButtonStyle: Int {
        case primary = 0
        case secondary = 1
    }
    
    @IBInspectable var style : Int = 0 {
        didSet {
            let buttonStyle = ButtonStyle(rawValue: style) ?? .primary
            set(buttonStyle)
        }
    }
    
    private func set(_ buttonStyle: ButtonStyle) {
        switch buttonStyle {
        case .primary:
            configurePrimaryButton()
        case .secondary:
            configureSecondaryButton()
        }
    }
    
    private func configurePrimaryButton() {
        backgroundColor = UIColor.dsPrimary
        titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        layer.cornerRadius = 5
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 4
    }

    private func configureSecondaryButton() {
        backgroundColor = .clear
        let yourAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 18),
            .foregroundColor: UIColor.dsPrimary,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        let attibuteString = NSMutableAttributedString(string: titleLabel?.text ?? "", attributes: yourAttributes)
        setAttributedTitle(attibuteString, for: .normal)
    }
}
