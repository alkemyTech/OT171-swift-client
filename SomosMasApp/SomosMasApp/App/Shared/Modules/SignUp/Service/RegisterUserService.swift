//
//  RegisterUserService.swift
//  SomosMasApp
//
//  Created by Braian Theiler on 23/03/2022.
//

import Foundation
import Alamofire

class RegisterUserService {

    func registerNewUser(userData: NewUser, onComplete: @escaping (UserRegisterResponse) -> Void, onError: @escaping () -> Void) {
        
        let webserviceURL = Bundle.main.object(forInfoDictionaryKey: "WEBSERVICE_URL") as! String
        guard let params = userData.dictionary else { return }
        
        ApiManager.shared.post(url:"\(webserviceURL)api/register", params: params, completion: {response in
            
            switch response {
                case .success(let data):
                    do {
                        
                        if let data = data {
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            let response = try decoder.decode(UserRegisterResponse.self, from: data)
                            onComplete(response)
                        } else {
                            onError()
                        }
                    } catch {
                        onError()
                        print(error)
                    }
                case .failure(_):
                    onError()
            }
        })
    }
}
