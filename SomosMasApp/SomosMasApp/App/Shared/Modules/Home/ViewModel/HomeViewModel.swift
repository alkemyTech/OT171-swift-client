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
            self.delegate.loading(state: true)
        } onError: {
            self.delegate.reloadSlider()
            self.delegate.loading(state: true)
        }
    }
    
    func getTestimonials() {
        testimonialsService.getAllSliders {response in
        self.testimonialsResponse = response
            self.getTestimonialsCount() == 0 ? self.delegate.hideTestimonials()
            : self.delegate.reloadTestimonials()
            self.delegate.loading(state: true)
        } onError: {
            self.delegate.hideTestimonials()
            self.delegate.loading(state: true)
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
