//
//  NewsService.swift
//  SomosMasApp
//
//  Created by Mariano Battaglia on 07/04/2022.
//

import Foundation

class NewsService {
    let webserviceURL = Bundle.main.object(forInfoDictionaryKey: "WEBSERVICE_URL") as! String
    
    func getLastestNewsData(completion: @escaping)
}
