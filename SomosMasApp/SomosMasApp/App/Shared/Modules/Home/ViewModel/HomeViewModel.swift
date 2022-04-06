//
//  HomeViewModel.swift
//  SomosMasApp
//
//  Created by Maximiliano Ituarte on 02/04/2022.
//

import Foundation

class SliderViewModel {
    
    private var sliderService: SliderService
    private var slidersResponded = [SlidersList]()
    private var delegate: SliderListDelegate
    
    init(service: SliderService, delegate: SliderListDelegate) {
        self.sliderService = service
        self.delegate = delegate
        
    }
    
    func getSliders(){
        sliderService.getAllSliders {response in
            self.slidersResponded = response
       
            self.delegate.reloadSlider()
        } onError: {
            self.delegate.reloadSlider()
        }
    }
    
    func getSliders(at index: Int) -> SlidersList {
        return slidersResponded[index]
    }
    
    func getSlidersCount() -> Int {
        return slidersResponded.count
    }
}



