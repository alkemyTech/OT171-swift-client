//
//  UserSession.swift
//  SomosMasApp
//
//  Created by Mariano Battaglia on 29/03/2022.
//

import Foundation

struct UserSession {

    init(token: String) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(token, forKey: "token")
    }
}
