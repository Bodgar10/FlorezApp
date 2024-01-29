//
//  HomeScreenViewController.swift
//  FlorezApp
//
//  Created by Bodgar Espinosa Miranda on 28/01/24.
//

import UIKit

class HomeScreenViewController: UIViewController {

    // MARK: IBOutlets
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let text = descriptionLabel.text ?? ""
        let attributedString = NSMutableAttributedString(string: text)
        let range = (text as NSString).range(of: "menos de 90 minutos.")
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 20), range: range)
        descriptionLabel.attributedText = attributedString
    }
    
    @IBAction func logInTapped(_ sender: CustomButton) {
        
    }
    
    @IBAction func signInTapped(_ sender: CustomButton) {
        
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
