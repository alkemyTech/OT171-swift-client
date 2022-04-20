//
//  NewsViewModel.swift
//  SomosMasApp
//
//  Created by Braian Theiler on 20/04/2022.
//


import Foundation

class NewsViewModel {
    private var service: NewsService
    private var newsList = [NewsList]()
    private var delegate: NewsDelegate

    init(service: NewsService, delegate: NewsDelegate){
        self.service = service
        self.delegate = delegate
    }

    func getNews(){
        service.getLastestNewsData {response in
            self.newsList = response
            self.delegate.reloadSlider()
            self.delegate.spinnerLoadingState(state: false)
        } onError: {
            self.delegate.reloadSlider()
            self.delegate.spinnerLoadingState(state: false)
        }
    }

    func getNews(at index: Int) -> NewsList {
        return newsList[index]
    }

    func getMembersCount() -> Int {
        return newsList.count
    }
}
