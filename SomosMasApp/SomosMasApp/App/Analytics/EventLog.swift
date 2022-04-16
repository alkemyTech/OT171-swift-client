//
//  EventLog.swift
//  SomosMasApp
//
//  Created by Mariano Battaglia on 15/04/2022.
//

import Foundation
import Firebase
import FirebaseAnalytics

final class Tracker {
    static func trackNewsSeeMoreEvent() {
        Analytics.logEvent("last_news_see_more_pressed", parameters: nil)
    }
    
    static func trackTestimoniesSeeMoreEvent() {
        Analytics.logEvent("testimonies_see_more_pressed", parameters: nil)
    }
}
