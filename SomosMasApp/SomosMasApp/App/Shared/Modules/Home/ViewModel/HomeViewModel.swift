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
    private var newsService: NewsService
    private var newsResponse = [NewsList]()
    private var delegate: SliderListDelegate
    
    init(service: SliderService, service3: NewsService, delegate: SliderListDelegate) {
        self.sliderService = service
        self.newsService = service3
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
    
    func getNews() {
        newsService.getLastestNewsData {response in
            self.newsResponse = response
            self.delegate.reloadNews()
        } onError: {
            self.delegate.reloadNews()
            self.delegate.hideSectionsWithoutData()
        }
    }
    
    func getSliders(at index: Int) -> SlidersList {
        return slidersResponded[index]
    }
    
    func getNews(at index: Int) -> NewsList {
        return newsResponse[index]
    }
    
    func getSlidersCount() -> Int {
        return slidersResponded.count
    }
    
    func getNewsCount() -> Int {
        return newsResponse.count
    }
}



