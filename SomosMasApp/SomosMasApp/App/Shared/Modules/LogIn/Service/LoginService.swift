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

    func login(user: Credentials, completionHandler: @escaping (ResultLoginHandler), errorHandler: @escaping (ErrorHandler)) {

        guard let params = user.dictionary else {return}
        
        ApiManager.shared.post(url: "\(webserviceURL)api/login", params: params, completion: { response in
            switch response {
                case .success(let data):
                    do {
                        if let data = data {
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            let response = try decoder.decode(LoginUserResponse.self, from: data)
                            if response.success {
                                completionHandler(response.data?.token ?? "")
                            } else {
                                errorHandler(response.message, true)
                            }
                        } else {
                            errorHandler(genericError, false)
                        }
                    } catch {
                        errorHandler(genericError, false)
                    }
                case .failure(let error):
                errorHandler(error.errorDescription ?? genericError, false)
            }
        })
    }
}

let genericError = "Unexpected error"

typealias ResultLoginHandler = (_ token : String) -> Void
typealias ErrorHandler = (_ errorMessage: String,_ handled: Bool) -> Void
