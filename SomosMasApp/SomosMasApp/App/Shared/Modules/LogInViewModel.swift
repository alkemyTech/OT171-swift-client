//
//  LogInViewModel.swift
//  SomosMasApp
//
//  Created by Hilario Cuervo on 22/03/2022.
//

import Foundation


class LogInViewModel {
    
    func validateAccess(email: String?, password: String?, completionHandler: @escaping (Bool, String?) -> Void) {
        
        let errorMessage = "Please, type something."
        let emptyFieldMessage = "Please, fill both fields."
        
        guard let safeEmail = email, let safePassword = password else {
            completionHandler(false, errorMessage)
            return
        }
        
        if safeEmail == "" || safePassword == "" {
            completionHandler(false, emptyFieldMessage)
            return
        }
        
        let validateResult = validateCredentials(email: safeEmail, password: safePassword)
        
        completionHandler(validateResult.0, validateResult.1)
    }
    
    
    private func validateCredentials(email: String, password: String) -> (Bool, String?) {
        
        var result = true
        var resultMessage: String?
        
        if !isEmailValid(email: email) {
            result = false
            resultMessage = "Please, enter a valid email."
        }
        
        if !isPasswordValid(password: password) {
            result = false
            resultMessage = "Password must be alphanumeric, have at least 6 characters and not contain spaces."
        }
        
        /*
        Aca se debe comprobar que las credenciales del usuario son correctas y en tal caso iniciar sesion, de lo contrario
        se debe modificar el resultMessage informando que los datos son incorrectos y setear result en false.
        */

        return (result,resultMessage)
    }
    
    
    private func isEmailValid(email: String) -> Bool {
        let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailPattern)
        
        return emailPredicate.evaluate(with: email)
    }
    
    
    private func isPasswordValid(password: String) -> Bool {
        return (password.count >= 6) && !password.contains(" ") && (password.range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil)
    }
    
}
