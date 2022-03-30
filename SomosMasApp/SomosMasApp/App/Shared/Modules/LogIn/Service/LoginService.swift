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
                            completionHandler(response.data.token ?? "")
                        } else {
                            errorHandler("unespected error")
                        }
                    } catch {
                        errorHandler("unespected error")
                    }
                case .failure(let error):
                errorHandler(error.errorDescription ?? "unespected error")
            }
        })
    }
}

typealias ResultLoginHandler = (_ token : String) -> Void
typealias ErrorHandler = (_ errorMessage: String) -> Void
