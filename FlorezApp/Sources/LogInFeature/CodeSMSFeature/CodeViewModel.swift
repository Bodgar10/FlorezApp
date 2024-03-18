//
//  CodeViewModel.swift
//  FlorezApp
//
//  Created by Bodgar Espinosa Miranda on 17/03/24.
//

import UIKit
import Firebase

final class CodeViewModel {
    
    private let navigation: UINavigationController?
    private var verificationID: String?
    
    init(navigation: UINavigationController?, verificationID: String?) {
        self.navigation = navigation
        self.verificationID = verificationID
    }
    
    var completion: ((Error) -> Void)?
    var completionSuccess: (() -> Void)?
    
    func verifyPhone(with phone: String?) {
        guard let phone, hasValidLenght(phone: phone) else { return }
        let phoneNumber = "+52\(phone)"
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
            if let error = error {
                self.completion?(error)
            } else {
                self.verificationID = verificationID
                self.completionSuccess?()
            }
        }
    }
    
    private func hasValidLenght(phone: String) -> Bool {
        if phone.isEmpty {
            let error = NSError(domain: "", code: -199, userInfo: [NSLocalizedDescriptionKey: "Escribe un número de teléfono válido."])
            completion?(error)
            return false
        } else if phone.count < 10 || phone.count > 10 {
            let error = NSError(domain: "", code: -199, userInfo: [NSLocalizedDescriptionKey: "El teléfono debe contener 10 números."])
            completion?(error)
            return false
        }
        return true
    }
    
}
