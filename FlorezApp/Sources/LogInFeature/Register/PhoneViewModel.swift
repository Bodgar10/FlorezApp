//
//  PhoneViewModel.swift
//  FlorezApp
//
//  Created by Bodgar Espinosa Miranda on 03/03/24.
//

import Firebase

final class PhoneViewModel {
    
    private let navigation: UINavigationController?
    
    init(navigation: UINavigationController?) {
        self.navigation = navigation
    }
    
    var completion: ((Error) -> Void)?
    
    func verifyPhone(with phone: String?) {
        guard let phone, hasValidLenght(phone: phone) else { return }
        let phoneNumber = "+52\(phone)"
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
            if let error = error {
                self.completion?(error)
            } else {
                self.navigation?.pushViewController(CodeViewController(), animated: true)
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
