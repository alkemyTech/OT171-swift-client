//
//  NosotrosService.swift
//  SomosMasApp
//
//  Created by Fran Nasich on 18/04/2022.
//

import Foundation

class NosotrosService {
    let webserviceURL = Bundle.main.object(forInfoDictionaryKey: "WEBSERVICE_URL") as! String
    
    func getAllSliders(onComplete: @escaping ([NosotrosList]) -> Void, onError: @escaping () -> Void) {
        ApiManager.shared.get(url: "\(webserviceURL)api/members") {response in
            switch response {
            case .success(let data):
                do{
                    if let data = data{
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let nosotrosResponse = try decoder.decode(NosotrosListResponse.self, from: data)
                        onComplete(nosotrosResponse.data)
                    }else{
                        onError()
                    }
                } catch{
                    onError()
                    print(error)
                }
                
            case .failure(_):
                onError()
            }
        }
    }
}
