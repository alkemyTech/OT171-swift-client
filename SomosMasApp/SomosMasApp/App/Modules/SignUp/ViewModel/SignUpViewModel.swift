//
//  SignUpViewModel.swift
//  SomosMasApp
//
//  Created by Mariano Battaglia on 17/03/2022.
//

import Foundation
import UIKit

class SignUpViewModel {
    
        private var user = ""
        private var password = ""
        private var confirmPassword = ""
        private var isValidEmail = false
        private var isValidPassword = false
        private var isValidConfirmPassword = false
        var isMatchPassword = false
        var isButtonSignUpShow: Observable<Bool> = Observable(false)
    
    func validateAccount(email: String, password: String, confirmPassword: String) {
        isValidEmail = email.isValidEmail ? true : false
        isValidPassword = password.isValidPassword ? true : false
        isValidConfirmPassword = confirmPassword.isValidConfirmPassword ? true : false
        isMatchPassword = (password == confirmPassword) ? true : false
    }
    
    func textFieldsInput() {
        if isValidEmail && isValidPassword && isValidConfirmPassword && isMatchPassword {
            isButtonSignUpShow.value = true
        } else {
            isButtonSignUpShow.value = false
        }
    }
    

}
