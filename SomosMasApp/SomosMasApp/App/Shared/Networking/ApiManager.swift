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
        AF.request(url, method: .post, parameters: params).validate().response { response in
            completion(response.result)
        }
    }
        
}
