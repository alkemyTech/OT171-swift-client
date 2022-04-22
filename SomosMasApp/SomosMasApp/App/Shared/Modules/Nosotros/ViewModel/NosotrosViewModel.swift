//
//  NosotrosViewModel.swift
//  SomosMasApp
//
//  Created by Fran Nasich on 18/04/2022.
//

import Foundation

class NosotrosViewModel {
    private var service: NosotrosService
    private var nosotrosList = [NosotrosList]()
    private var delegate: NosotrosDelegate
    
    init(service: NosotrosService, delegate: NosotrosDelegate){
        self.service = service
        self.delegate = delegate
    }
    
    func getMembers(){
        service.getAllSliders {response in
            self.nosotrosList = response
            self.delegate.reloadSlider()
            self.delegate.spinnerLoadingState(state: false)
        } onError: {
            self.delegate.reloadSlider()
            self.delegate.spinnerLoadingState(state: false)
        }
    }
    
    func getMember(at index: Int) -> NosotrosList {
        return nosotrosList[index]
    }
    
    func getMembersCount() -> Int {
        return nosotrosList.count
    }
}
