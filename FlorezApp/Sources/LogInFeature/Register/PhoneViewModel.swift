//
//  PhoneViewModel.swift
//  FlorezApp
//
//  Created by Bodgar Espinosa Miranda on 03/03/24.
//

import Firebase

/// Programación orientada a objetos. (struct)
/// Programación orientada a protocolos.


protocol PhoneProtocol {
    func verifyPhone(with phone: String?)
}

/// MVVM MVP VIPER MVVM +C MVC VIP SOLID Principles.
/// MVVM + C
/// 1.- Se hace la navegacion. -> Router, Coordinator
/// 2.- Se ejecuta el servicio de verificar teléfono. -> Interactor, ViewModel, Coordinator.
/// 3.- Se validan errores internos y de servidor. -> Interactor, ViewModel
///
/// RXSwift o Combine
final class PhoneViewModel: PhoneProtocol {
    
    private let navigation: UINavigationController?
    
    init(navigation: UINavigationController?) {
        self.navigation = navigation
    }
    
    var completion: ((Error?) -> Void)?
    
    func verifyPhone(with phone: String?) {
        guard let phone, hasValidLenght(phone: phone) else { return }
        let phoneNumber = "+52\(phone)"
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
            if let error {
                self.completion?(error)
            } else {
                self.completion?(nil)
                let viewController = CodeViewController()
                viewController.viewModel = CodeViewModel(navigation: self.navigation, verificationID: verificationID)
                viewController.phone = phone
                self.navigation?.pushViewController(viewController, animated: true)
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
