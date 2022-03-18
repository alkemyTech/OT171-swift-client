//
//  ApiManager.swift
//  SomosMasApp
//
//  Created by Braian Theiler on 17/03/2022.
//

import Foundation
import Alamofire

class ApiManager {
    
    func get(url: String, completion: @escaping (Result<Data?, AFError>) -> Void) {
        AF.request(url).response { response in
            completion(response.result)
        }

    }
    
}
