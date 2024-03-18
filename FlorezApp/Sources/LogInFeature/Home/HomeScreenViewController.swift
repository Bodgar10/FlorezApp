//
//  HomeScreenViewController.swift
//  FlorezApp
//
//  Created by Bodgar Espinosa Miranda on 28/01/24.
//

import UIKit

class HomeScreenViewController: MainViewController {

    // MARK: IBOutlets
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var creditCardView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creditCardView.layer.cornerRadius = 10.0
        creditCardView.layer.borderWidth = 1
        creditCardView.layer.borderColor = UIColor.black.cgColor
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(creditCardTapped))
        creditCardView.addGestureRecognizer(gesture)
    }
    
    @objc func creditCardTapped() {
        print("CLICK A LA TArjeta de credito.")
    }
    
    @IBAction func logInTapped(_ sender: CustomButton) {
        let signInPhoneVC = EnterPhoneViewController()
        navigationController?.pushViewController(signInPhoneVC, animated: true)
    }
    
    @IBAction func signInTapped(_ sender: CustomButton) {
        let signInPhoneVC = EnterPhoneViewController()
        navigationController?.pushViewController(signInPhoneVC, animated: true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
