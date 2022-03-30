//
//  LogInViewModel.swift
//  SomosMasApp
//
//  Created by Hilario Cuervo on 23/03/2022.
//

import Foundation
import Alamofire

class LogInViewModel {
    
    private let delegate: LogInDelegate
    
    init(delegate: LogInDelegate){
        self.delegate = delegate
    }
    
    var newUserSession = {(_ userSession: UserSession) -> Void in }
    
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
        
        if !email.isValidEmail {
            result = false
            resultMessage = "Please, enter a valid email."
        }
        
        if !password.isValidPassword {
            result = false
            resultMessage = "Password must be alphanumeric, have at least 8 characters and not contain spaces."
        }
        
        /*
        Aca se debe comprobar que las credenciales del usuario son correctas y en tal caso iniciar sesion, de lo contrario
        se debe modificar el resultMessage informando que los datos son incorrectos y setear result en false.
        */

        return (result,resultMessage)
    }
    
    // [OT171-25] Save Token:
    func startSession(user: Credentials) {
        LoginService().login(user: user) { token in
            // Token Saved
            let session = UserSession(token: token)
            self.newUserSession(session)
            // Navigation to Home View here
        } errorHandler: { errorMessage in
            // Modal for Error could be here.
        }
    }
}
