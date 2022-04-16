//
//  EventLog.swift
//  SomosMasApp
//
//  Created by Mariano Battaglia on 15/04/2022.
//

import Foundation
import Firebase

final class Tracker {
    static func trackNewsSeeMoreEvent() {
        Analytics.logEvent("last_news_see_more_pressed", parameters: nil)
    }
    
    static func trackTestimoniesSeeMoreEvent() {
        Analytics.logEvent("testimonies_see_more_pressed", parameters: nil)
    }
    
    static func trackSliderRetrieveSuccess() {
        Analytics.logEvent("slider_retrieve_success", parameters: nil)
    }
    
    static func trackSliderRetrieveError(error: String) {
        Analytics.logEvent("slider_retrieve_error", parameters: ["error": error])
    }
    
    static func trackNewsRetrieveSuccess() {
        Analytics.logEvent("last_news_retrieve_success", parameters: nil)
    }
    
    static func trackNewsRetrieveError(error: String) {
        Analytics.logEvent("last_news_retrieve_error", parameters: ["error": error])
    }
    
    static func trackTestimonialsRetrieveSuccess() {
        Analytics.logEvent("testimonios_retrieve_success", parameters: nil)
    }
    
    static func trackTestimonialsRetrieveError(error: String) {
        Analytics.logEvent("testimonies_retrieve_error", parameters: ["error": error])
    }
}
