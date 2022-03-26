//
//  LoginService.swift
//  SomosMasApp
//
//  Created by Mariano Battaglia on 26/03/2022.
//

import Foundation
import Alamofire

struct LoginService {

    static let shared = LoginService()
    let baseURL = "https://ongapi.alkemy.org/api/login"
    let token = ""

    func login(user: Credentials, completionHandler: @escaping ResultLoginHandler, errorHandler: @escaping ErrorHandler) {

        let Encoder = JSONParameterEncoder.default
        AF.request(baseURL, method: .post, parameters: user, encoder: Encoder).responseDecodable(of: LoginUserResponse.self, decoder: JSONDecoder()){ response in

            switch response.result {
            case .success(let data):
                guard let token = data.data.token else {
                    errorHandler(data.message)
                    print(token)
                    return
                }
                completionHandler(token)
            case .failure(let error):
                errorHandler(error.localizedDescription)
            }
        }
    }
}

typealias ResultLoginHandler = (_ token : String) -> Void
typealias ErrorHandler = (_ errorMessage: String) -> Void
