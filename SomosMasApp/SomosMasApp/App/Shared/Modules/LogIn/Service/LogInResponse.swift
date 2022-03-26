//
//  LogInResponse.swift
//  SomosMasApp
//
//  Created by Mariano Battaglia on 25/03/2022.
//

import Foundation

// User Response
struct LoginUserResponse: Codable {
    let success: Bool
    let data: LoginDataResponse
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case success
        case data
        case message
    }
}

// Data Response
struct LoginDataResponse: Codable {
    
    let user: UserLogin
    let token: String
    
    enum CodingKeys: String, CodingKey {
        case user
        case token
    }
}

struct UserLogin: Codable {
    let id: Int
    let name: String
    let email: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case email
    }
    
}
