//
//  TestimonialsService.swift
//  SomosMasApp
//
//  Created by Fran Nasich on 06/04/2022.
//

import Foundation

class TestimonialsService {
    let webserviceURL = Bundle.main.object(forInfoDictionaryKey: "WEBSERVICE_URL") as! String
    
    func getAllSliders(onComplete: @escaping ([TestimonialsList]) -> Void, onError: @escaping () -> Void) {
        ApiManager.shared.get(url: "\(webserviceURL)api/testimonials") {response in
            switch response {
            case .success(let data):
                do{
                    if let data = data{
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let testimonialsResponse = try decoder.decode(TestimonialsListResponse.self, from: data)
                        onComplete(testimonialsResponse.data)
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
