//
//  UserRegisterResponse.swift
//  SomosMasApp
//
//  Created by Braian Theiler on 23/03/2022.
//

struct UserRegisterResponse: Codable {
    let success: Bool
    let data: UserData
    let message: String
}

struct UserData: Codable {
    let user: User
    let token: String
}

struct User: Codable {
    let name, email, password: String
    let roleId: Int
    let updatedAt, createdAt: String
    let id: Int
}
