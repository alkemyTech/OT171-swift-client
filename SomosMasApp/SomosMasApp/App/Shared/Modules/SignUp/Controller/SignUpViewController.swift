//
//  SignUpViewController.swift
//  SomosMasApp
//
//  Created by Fran Nasich on 17/03/2022.
//

import UIKit
import Alamofire

protocol RegisterUserDelegate {
    func userRegistered()
    func showError()
}

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var signUpUsernameLabel: UITextField!
    @IBOutlet weak var signUpMailLabel: UITextField!
    @IBOutlet weak var signUpPassLabel: UITextField!
    @IBOutlet weak var signUpConfirmPassLabel: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var passwordError: UILabel!
    private let service = RegisterUserService()
    private var viewModel: SignUpViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = SignUpViewModel(service: service, delegate: self)
        setupTextFieldDelegates()
        hideSignUpButton()
        setupTextSelector()
        bindingButton()
    }

    func showSignUpButton() {
        registerButton.isEnabled = true
    }
    
    private func hideSignUpButton() {
        registerButton.isEnabled = false
        registerButton.backgroundColor = .clear
    }
    
    func bindingButton() {
        viewModel?.isButtonSignUpShow.bind { [weak self] in
            $0 ? self?.showSignUpButton() : self?.hideSignUpButton()
        }
    }
    
    func setupTextSelector() {
        signUpUsernameLabel.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        signUpMailLabel.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        signUpPassLabel.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        signUpConfirmPassLabel.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let userText = signUpUsernameLabel.text,
           let emailText = signUpMailLabel.text,
           let passwordText = signUpPassLabel.text,
           let confirmPasswordText = signUpConfirmPassLabel.text {
            viewModel?.validateAccount(user: userText, email: emailText, password: passwordText, confirmPassword: confirmPasswordText)
        }
        viewModel?.textFieldsInput()
    }

    func setupTextFieldDelegates() {
        signUpUsernameLabel.delegate = self
        signUpMailLabel.delegate = self
        signUpPassLabel.delegate = self
        signUpConfirmPassLabel.delegate = self
    }

    @IBAction func signUpUser(_ sender: Any) {
        self.showSpinner(onView: self.view)
        if let name = signUpUsernameLabel.text, let email = signUpMailLabel.text, let password = signUpPassLabel.text {
            viewModel?.registerUser(name: name, email: email, password: password)
        }
    }
}

extension  SignUpViewController {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        switch textField {
        case self.signUpUsernameLabel:
            guard let currentUsername = textField.text else {return}
        case self.signUpMailLabel:
            guard let currentMail = textField.text else {return}
        case self.signUpPassLabel:
            passwordError.isHidden = textField.text?.isValidPassword ?? false
        case self.signUpConfirmPassLabel:
            if ((viewModel?.isMatchPassword) != nil) {
                passwordError.isHidden = true
            } else {
                passwordError.isHidden = false
            } default:
            return
        }
    }
}

extension SignUpViewController: RegisterUserDelegate {
    
    func userRegistered() {
        self.removeSpinner()
        let alert = UIAlertController(title: "User was succesfully register", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: {(action: UIAlertAction!) in
            let logInViewController = logInViewController()
            self.navigationController?.pushViewController(logInViewController, animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showError() {
        self.removeSpinner()
        let alert = UIAlertController(title: "Ha ocurrido un error", message: "No se pudo registrar al usuario, revise que los datos sean correctos y vuelva a intentarlo", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
