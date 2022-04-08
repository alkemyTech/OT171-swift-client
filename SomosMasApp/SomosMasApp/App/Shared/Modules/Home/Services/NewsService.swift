//
//  NewsService.swift
//  SomosMasApp
//
//  Created by Mariano Battaglia on 08/04/2022.
//

import Foundation

class NewsService {
    let webserviceURL = Bundle.main.object(forInfoDictionaryKey: "WEBSERVICE_URL") as! String
    
    func getLastestNewsData(onComplete: @escaping ([NewsList]) -> Void, onError: @escaping () -> Void) {
        ApiManager.shared.get(url: "\(webserviceURL)api/news") { response in
            switch response {
            case .success(let data):
                do{
                    if let data = data {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let newsResponse = try decoder.decode(NewsListResponse.self, from: data)
                        onComplete(newsResponse.data)
                    } else {
                        onError()
                    }
                } catch {
                    onError()
                    print(error)
                }
            case.failure(_):
                onError()
            }
        }
    }
}
