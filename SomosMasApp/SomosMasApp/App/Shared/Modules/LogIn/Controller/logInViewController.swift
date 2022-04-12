//
//  logInViewController.swift
//  SomosMasApp
//
//  Created by Maximiliano Ituarte on 18/03/2022.
//

import UIKit
import Alamofire

protocol LogInDelegate {
    func showMessage(message:String)
    func showHandledError(message:String)
    func presentTabBar()
}

class logInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var warningLabel: UILabel!
    
    private var viewModel: LogInViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        // Associates a target object and action method with the control
        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        viewModel = LogInViewModel(delegate: self)
        emailTextField.delegate = self
        passwordTextField.delegate = self
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        warningLabel.isHidden = true
    }
    
    // function to hide warningLabel when the user change the text 
    @objc func textFieldDidChange(_ textField: UITextField) {
        warningLabel.isHidden = true
    }
    
    @IBAction func logInButtonPressed(_ sender: UIButton) {
        self.showSpinner(onView: self.view)
        viewModel.validateAccess(email: emailTextField.text, password: passwordTextField.text) { confirmAccess, errorMessage in
            if !confirmAccess {
                self.warningLabel.text = errorMessage!
                self.warningLabel.isHidden = false
            } else {
                self.warningLabel.isHidden = true
                self.userValidation()
            }
        }
    }
    
    func userValidation() {
        let user = Credentials(email: emailTextField?.text, password: passwordTextField?.text)
        viewModel.startSession(user: user)
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

// LogInDelegate extension
extension logInViewController: LogInDelegate {
    
    func showHandledError(message:String) {
        warningLabel.text = message
        warningLabel.isHidden = false
    }
    
    func showMessage(message:String) {
        let alert = UIAlertController(title: "An error has been ocurred", message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
    }
    
    func presentTabBar(){
        let tabBarController = TabBarViewController()
        tabBarController.modalPresentationStyle = .overFullScreen
        self.present(tabBarController, animated: true, completion: nil)
    }
}
