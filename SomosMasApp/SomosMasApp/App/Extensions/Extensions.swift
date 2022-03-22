//
//  Extensions.swift
//  SomosMasApp
//
//  Created by Mariano Battaglia on 17/03/2022.
//

import Foundation

extension String {
    
    // Regular expressions to validate fields
    var isValidUser: Bool {
        NSPredicate(format: "SELF MATCHES %@", "^(?=.{6,12}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$").evaluate(with: self)
    }
    
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
    
    var isValidPassword: Bool {
        NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$").evaluate(with: self)
    }
    
}
