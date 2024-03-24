//
//  PaymentViewController.swift
//  FlorezApp
//
//  Created by Pedro Uvaldo on 17/03/24.
//

import UIKit

class PaymentViewController: UIViewController {
    @IBOutlet weak var  creditCardUI : UIView!
    @IBOutlet weak var  paypalCardUI: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCards(view:creditCardUI)
        configCards(view:paypalCardUI)
        
        // Do any additional setup after loading the view.
    }
    private func configCards(view:UIView){
        view.layer.cornerRadius = 4.0
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
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
