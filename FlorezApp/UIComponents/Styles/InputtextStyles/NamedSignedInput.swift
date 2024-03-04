//
//  CustomInputText.swift
//  FlorezApp
//
//  Created by Pedro Uvaldo on 17/02/24.
//
import UIKit
class NamedSignedInput : UITextField{

    @IBInspectable override var text: String?{
        didSet{
            set()
        }
    }
    private func set(){
        textColor = UIColor.black
        font = UIFont.systemFont(ofSize: 17, weight: .regular)
        textAlignment = .left
        borderStyle = .none
        minimumFontSize = 17
        textContentType = UITextContentType.namePrefix
    }

}
