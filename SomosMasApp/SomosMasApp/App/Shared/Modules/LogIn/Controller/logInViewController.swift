//
//  logInViewController.swift
//  SomosMasApp
//
//  Created by Maximiliano Ituarte on 18/03/2022.
//

import UIKit

class logInViewController: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func logInButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        let signUpController = SignUpViewController()
        self.navigationController?.pushViewController(signUpController, animated: true)
    }
    
}
