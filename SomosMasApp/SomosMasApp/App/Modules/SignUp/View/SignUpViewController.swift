//
//  SignUpViewController.swift
//  SomosMasApp
//
//  Created by Fran Nasich on 16/03/2022.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {

    var signUpViewModel = SignUpViewModel()
    
    @IBOutlet weak var signUpMailLabel: UITextField!
    @IBOutlet weak var signUpPassLabel: UITextField!
    @IBOutlet weak var signUpConfirmPassLabel: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var passwordError: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFieldDelegates()
        bindingButton()
        hideSignUpButton()
        setupTextSelector()
    }
    
    func showSignUpButton() {
        registerButton.isEnabled = true
    }
    
    private func hideSignUpButton() {
        registerButton.isEnabled = false
        registerButton.backgroundColor = .clear
    }
    
    func bindingButton() {
        signUpViewModel.isButtonSignUpShow.bind { [weak self] in
            $0 ? self?.showSignUpButton() : self?.hideSignUpButton()
        }
    }
    
    func setupTextSelector() {
        signUpMailLabel.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        signUpPassLabel.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        signUpConfirmPassLabel.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let emailText = signUpMailLabel.text,
           let passwordText = signUpPassLabel.text,
           let confirmPasswordText = signUpConfirmPassLabel.text {
            signUpViewModel.validateAccount(email: emailText, password: passwordText, confirmPassword: confirmPasswordText)
        }
        signUpViewModel.textFieldsInput()
    }
    
    func setupTextFieldDelegates() {
        signUpMailLabel.delegate = self
        signUpPassLabel.delegate = self
        signUpConfirmPassLabel.delegate = self
    }
    
}

extension  SignUpViewController {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        switch textField {
        case self.signUpMailLabel:
            guard let currentMail = textField.text else {return}
            
        case self.signUpPassLabel:
            passwordError.isHidden = textField.text?.isValidPassword ?? false
        case self.signUpConfirmPassLabel:
            if !(signUpViewModel.isMatchPassword) {
                passwordError.isHidden = false
            } else {
                passwordError.isHidden = true
            } default:
            return
        }
    }
}
