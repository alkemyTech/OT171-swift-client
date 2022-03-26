//
//  ApiManager.swift
//  SomosMasApp
//
//  Created by Braian Theiler on 17/03/2022.
//

import Foundation
import Alamofire

struct ApiManager {
    
    static let shared = ApiManager()
    
    func get(url: String, completion: @escaping (Result<Data?, AFError>) -> Void) {
        AF.request(url).response { response in
            completion(response.result)
        }
    }
    
    func post(url: String, params: [String:Any] ,completion: @escaping (Result<Data?, AFError>) -> Void) {
        AF.request(url, method: .post, parameters: params).response { response in
            completion(response.result)
        }
    }
    
    // LOGIN USER POST
    func loginUser(email: String, password: String,  sucess: @escaping (_ loginDataResponse: LoginUserResponse) -> (), failure: @escaping ( _ error: Error?) -> () ) {
            
        let params: [String: String] = ["email": email, "password": password]
        let serverUrl = Bundle.main.object(forInfoDictionaryKey: "WEBSERVICE_URL") as! String
        let finalUrl = serverUrl + "login"
        
        AF.request(finalUrl, method: .post, parameters: params,  encoder: JSONParameterEncoder.default).validate(statusCode: 200...299).responseDecodable(of: LoginUserResponse.self) {
            response in
            if let userResponse = response.value {
                sucess(userResponse)
                print("success")
            } else {
                failure(response.error)
                print("error")
            }
        }
    }
    
}
