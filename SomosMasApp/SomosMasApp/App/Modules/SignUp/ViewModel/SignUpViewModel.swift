//
//  SignUpViewModel.swift
//  SomosMasApp
//
//  Created by Mariano Battaglia on 20/03/2022.
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
    

}
