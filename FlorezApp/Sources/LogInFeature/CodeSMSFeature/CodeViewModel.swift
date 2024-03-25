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
    
    var completion: ((Error?) -> Void)?
    var completionSuccess: (() -> Void)?
    
    func verifyPhone(with phone: String?) {
        guard let phone, hasValidLenght(value: phone, with: 10, andErrorMessage: "teléfono") else { return }
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
    
    func signIn(verificationCode: String) {
        guard hasValidLenght(value: verificationCode, with: 6, andErrorMessage: "código"), 
                let verificationID else { return }
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: verificationID,
            verificationCode: verificationCode)
        Auth.auth().signIn(with: credential) { result, error in
            if let error {
                self.completion?(error)
            } else {
                self.completion?(nil)
                let additionalInfoVC = AdditionalInfoSignInViewController()
                additionalInfoVC.viewModel = AdditionalInfoViewModel(uid: result?.user.uid)
                self.navigation?.pushViewController(additionalInfoVC, animated: true)
            }
        }
    }
    
    private func hasValidLenght(value: String, with lenght: Int, andErrorMessage: String) -> Bool {
        if value.isEmpty {
            let error = NSError(domain: "", code: -199, userInfo: [NSLocalizedDescriptionKey: "Escribe un \(andErrorMessage) válido."])
            completion?(error)
            return false
        } else if value.count < lenght || value.count > lenght {
            let error = NSError(domain: "", code: -199, userInfo: [NSLocalizedDescriptionKey: "El \(andErrorMessage) debe contener \(lenght) números."])
            completion?(error)
            return false
        }
        return true
    }
    
}
