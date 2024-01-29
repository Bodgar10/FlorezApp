//
//  CustomLabel.swift
//  FlorezApp
//
//  Created by Bodgar Espinosa Miranda on 28/01/24.
//

import UIKit

class CustomLabel: UILabel {
    
    enum LabelStyle: Int {
        case title = 0
        case body = 1
        case boldDescription = 2
    }
    
    @IBInspectable var style: Int = 0 {
        didSet {
            let labelStyle = LabelStyle(rawValue: style) ?? .title
            set(labelStyle)
        }
    }
    
    @IBInspectable var rangeString: String = "" {
        didSet {
            let labelStyle = LabelStyle(rawValue: style) ?? .title
            set(labelStyle, with: rangeString)
        }
    }
    
    private func set(_ labelStyle: LabelStyle, with range: String? = nil) {
        switch labelStyle {
        case .title:
            font = UIFont.systemFont(ofSize: 27, weight: .semibold)
        case .body:
            font = UIFont.systemFont(ofSize: 20)
            let text = text ?? ""
            let attributedString = NSMutableAttributedString(string: text)
            let range = (text as NSString).range(of: rangeString)
            attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 20), range: range)
            attributedText = attributedString
        case .boldDescription:
            font = UIFont.systemFont(ofSize: 17, weight: .bold)
        }
    }
}
