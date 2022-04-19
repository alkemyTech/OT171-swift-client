//
//  HomeViewModel.swift
//  SomosMasApp
//
//  Created by Maximiliano Ituarte on 02/04/2022.
//

import Foundation
import UIKit

class SliderViewModel {
    
    private var sliderService: SliderService
    private var slidersResponded = [SlidersList]()
    private var testimonialsService: TestimonialsService
    private var testimonialsResponse = [TestimonialsList]()
    private var newsService: NewsService
    private var newsResponse = [NewsList]()
    private var delegate: SliderListDelegate
    private var dispatchgroup = DispatchGroup()
    
    init(service1: SliderService, service2: TestimonialsService, service3: NewsService, delegate: SliderListDelegate) {
        self.sliderService = service1
        self.testimonialsService = service2
        self.newsService = service3
        self.delegate = delegate
    }
    
    func getSliders(){
        dispatchgroup.enter()
        sliderService.getAllSliders {response in
            self.slidersResponded = response
            self.delegate.reloadSlider()
            self.dispatchgroup.leave()
        } onError: {
            self.delegate.reloadSlider()
            self.dispatchgroup.leave()
        }
    }
    
    func getTestimonials() {
        dispatchgroup.enter()
        testimonialsService.getAllSliders {response in
        self.testimonialsResponse = response
            self.getTestimonialsCount() == 0 ? self.delegate.hideTestimonials()
            : self.delegate.reloadTestimonials()
            self.dispatchgroup.leave()
        } onError: {
            self.delegate.hideTestimonials()
            self.dispatchgroup.leave()
        }
    }
    
    func getNews() {
        dispatchgroup.enter()
        newsService.getLastestNewsData {response in
            self.newsResponse = response
            self.getNewsCount() == 0 ? self.delegate.hideSectionsWithoutData() : self.delegate.reloadNews()
            self.dispatchgroup.leave()
        } onError: {
            self.delegate.reloadNews()
            self.delegate.hideSectionsWithoutData()
            self.dispatchgroup.leave()
        }
    }
    
    func getSliders(at index: Int) -> SlidersList {
        return slidersResponded[index]
    }
    
    func getTestimonial(at index: Int) -> TestimonialsList {
        return testimonialsResponse[index]
    }
    
    func getNews(at index: Int) -> NewsList {
        return newsResponse[index]
    }
    
    func getSlidersCount() -> Int {
        return slidersResponded.count
    }
    
    func getTestimonialsCount() -> Int {
        return testimonialsResponse.count
    }
    
    func getNewsCount() -> Int {
        return newsResponse.count
    }
    
    func spinner() {
        dispatchgroup.enter()
        self.delegate.spinnerLoadingState(state: false)
        dispatchgroup.leave()
    }
    
    func loadAllServices() {
        print("cargando")
        DispatchQueue.main.async {
            self.spinner()
            print("listo0")
        }
        DispatchQueue.global(qos: .default).async {
            self.getSliders()
            print("listo1")
        }

        DispatchQueue.global(qos: .default).async {
            self.getTestimonials()
            print("listo2")
        }
        DispatchQueue.global(qos: .default).async {
            self.getNews()
            print("listo3")
        }
        dispatchgroup.wait()
        print("carga completa")
    }
              
    let imageError : String = "Unexpected error loading image"
}
