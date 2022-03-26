//
//  logInViewController.swift
//  SomosMasApp
//
//  Created by Maximiliano Ituarte on 18/03/2022.
//

import UIKit

class logInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var warningLabel: UILabel!
    
    private let viewModel = LogInViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        warningLabel.isHidden = true
    }
    

    @IBAction func logInButtonPressed(_ sender: UIButton) {
        // API validation
        viewModel.loginUser { loginStatus in
            loginStatus ? print("go home view") : print("show modal")
        }
        // text validation
        viewModel.validateAccess(email: emailTextField.text, password: passwordTextField.text) { confirmAccess, errorMessage in
            if !confirmAccess {
                self.warningLabel.text = errorMessage!
                self.warningLabel.isHidden = false
            } else {
                self.warningLabel.isHidden = true
            }
        }
    }
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        let signUpController = SignUpViewController()
        self.navigationController?.pushViewController(signUpController, animated: true)
    }
    
}


// MARK: - UITextFieldDelegate

extension logInViewController: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        warningLabel.isHidden = true
    }

}
