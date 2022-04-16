//
//  HomeService.swift
//  SomosMasApp
//
//  Created by Maximiliano Ituarte on 02/04/2022.
//

import Foundation


class SliderService {
    
    let webserviceURL = Bundle.main.object(forInfoDictionaryKey: "WEBSERVICE_URL") as! String
    
    
    func getAllSliders(onComplete: @escaping ([SlidersList]) -> Void, onError: @escaping () -> Void) {
        ApiManager.shared.get(url: "\(webserviceURL)api/slides") {response in
            switch response {
            case .success(let data):
                
                do{
                    if let data = data{
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let sliderResponse = try decoder.decode(SliderListResponse.self, from: data)
                        onComplete(sliderResponse.data)
                        Tracker.trackSliderRetrieveSuccess()
                    }else{
                        onError()
                    }
                } catch{
                    onError()
                    print(error)
                    Tracker.trackSliderRetrieveError(error: error.localizedDescription)
                }
                
            case .failure(_):
                onError()
            }
        }
    }
}
