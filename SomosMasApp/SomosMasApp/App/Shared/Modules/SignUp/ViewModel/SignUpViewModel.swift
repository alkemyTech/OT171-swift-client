//
//  SignUpViewModel.swift
//  SomosMasApp
//
//  Created by Mariano Battaglia on 22/03/2022.
//

import Foundation
import UIKit

class SignUpViewModel {
    
    private var user = ""
    private var email = ""
    private var password = ""
    private var confirmPassword = ""
    private var isValidUser = false
    private var isValidEmail = false
    private var isValidPassword = false
    private var isValidConfirmPassword = false
    var isMatchPassword = false
    var isButtonSignUpShow: Observable<Bool> = Observable(false)
    
    private var service: RegisterUserService
    private var delegate: RegisterUserDelegate
    
    init(service: RegisterUserService, delegate: RegisterUserDelegate) {
        self.service = service
        self.delegate = delegate
    }
    
    func validateAccount(user: String, email: String, password: String, confirmPassword: String) {
        isValidUser = user.isValidUser ? true : false
        isValidEmail = email.isValidEmail ? true : false
        isValidPassword = password.isValidPassword ? true : false
        isValidConfirmPassword = confirmPassword.isValidPassword ? true : false
        isMatchPassword = (password == confirmPassword) ? true : false
    }
    
    func textFieldsInput() {
        if isValidUser && isValidEmail && isValidPassword && isValidConfirmPassword && isMatchPassword {
            isButtonSignUpShow.value = true
        } else {
            isButtonSignUpShow.value = false
        }
    }
    
    func registerUser(name: String, email: String, password: String) {
        let newUser = NewUser(name: name, email: email, password: password)
        service.registerNewUser(userData: newUser, onComplete: { response in
            self.delegate.userRegistered()
        }, onError: {
            self.delegate.showError()
        })
    }
}
