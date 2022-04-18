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
    
    init(service1: SliderService, service2: TestimonialsService, service3: NewsService, delegate: SliderListDelegate) {
        self.sliderService = service1
        self.testimonialsService = service2
        self.newsService = service3
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
    
    func getNews() {
        newsService.getLastestNewsData {response in
            self.newsResponse = response
            self.getNewsCount() == 0 ? self.delegate.hideSectionsWithoutData() : self.delegate.reloadNews()
            self.delegate.loading(state: true)
        } onError: {
            self.delegate.reloadNews()
            self.delegate.hideSectionsWithoutData()
            self.delegate.loading(state: true)
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

    func allService() {
        let dispatchGroup = DispatchGroup()

        func loadSliders() {
             dispatchGroup.enter()
             getSliders()
             dispatchGroup.leave()
        }
        
        func loadTestimonials() {
             dispatchGroup.enter()
             getTestimonials()
             dispatchGroup.leave()
        }
        
        func loadNews() {
             dispatchGroup.enter()
             getNews()
             dispatchGroup.leave()
        }
        
        func loadSpinner() {
            dispatchGroup.enter()
            self.delegate.loading(state: false)
        }

        DispatchQueue.main.async {
             loadSpinner()
            print("terminado 4")
        }
        
        DispatchQueue.global(qos: .default).async {
             loadSliders()
            print("terminado 1")
        }

        DispatchQueue.global(qos: .default).async {
             loadTestimonials()
            print("terminado 2")
        }
        
        DispatchQueue.global(qos: .default).async {
             loadNews()
            print("terminado 3")
        }
        
        dispatchGroup.wait()
    }

        
    let imageError : String = "Unexpected error loading image"
}
