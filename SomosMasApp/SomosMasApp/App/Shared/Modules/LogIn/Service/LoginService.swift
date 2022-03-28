//
//  LoginService.swift
//  SomosMasApp
//
//  Created by Mariano Battaglia on 26/03/2022.
//

import Foundation
import Alamofire

struct LoginService {

    let webserviceURL = Bundle.main.object(forInfoDictionaryKey: "WEBSERVICE_URL") as! String
    let token = ""

    func login(user: Credentials, completionHandler: @escaping ResultLoginHandler, errorHandler: @escaping ErrorHandler) {

        let Encoder = JSONParameterEncoder.default
        AF.request("\(webserviceURL)api/login", method: .post, parameters: user, encoder: Encoder).responseDecodable(of: LoginUserResponse.self, decoder: JSONDecoder()){ response in

            switch response.result {
            case .success(let data):
                guard let token = data.data.token else {
                    errorHandler(data.message)
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
