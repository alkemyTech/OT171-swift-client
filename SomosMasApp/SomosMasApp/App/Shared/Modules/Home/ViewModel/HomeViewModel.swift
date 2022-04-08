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
    private var testimonialsService: TestimonialsService
    private var testimonialsResponse = [TestimonialsList]()
    private var delegate: SliderListDelegate
    
    init(service1: SliderService, service2: TestimonialsService, delegate: SliderListDelegate) {
        self.sliderService = service1
        self.testimonialsService = service2
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
    
    func getTestimonials() {
     //   let testimonialsArray = [String]()
     //   return testimonialsArray
        testimonialsService.getAllSliders {response in
        self.testimonialsResponse = response
        self.delegate.reloadTestimonials()
        } onError: {
            self.delegate.hideTestimonials()
            self.delegate.hideLabel()
        }
    }
    
    func getSliders(at index: Int) -> SlidersList {
        return slidersResponded[index]
    }
    
    func getTestimonial(at index: Int) -> TestimonialsList {
        return testimonialsResponse[index]
    }
    
    func getSlidersCount() -> Int {
        return slidersResponded.count
    }
    
    func getTestimonialsCount() -> Int {
        return testimonialsResponse.count
    }
}
