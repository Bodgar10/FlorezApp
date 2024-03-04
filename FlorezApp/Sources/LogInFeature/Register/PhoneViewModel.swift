//
//  PhoneViewModel.swift
//  FlorezApp
//
//  Created by Bodgar Espinosa Miranda on 03/03/24.
//

import Firebase

final class PhoneViewModel {
    
    var completion: ((Error) -> Void)?
    
    func verifyPhone(with phone: String) {
        PhoneAuthProvider.provider().verifyPhoneNumber(phone, uiDelegate: nil) { verificationID, error in
            if let error = error {
                self.completion?(error)
            } else {
                print(verificationID)
            }
        }
    }
}
