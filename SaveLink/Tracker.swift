//
//  Tracker.swift
//  SaveLink
//
//  Created by Christian Manzaraz on 10/10/2023.
//

import Foundation
import FirebaseAnalytics

final class Tracker {
    static func trackCreateLinkEvent(url: String) {
        Analytics.logEvent("CreateLinkEvent", 
                           parameters: ["url" : url])
        
    }
    
    static func trackerSaveLinkEvent() {
        Analytics.logEvent("SaveLinkEvent", parameters: nil)
    }
    
    static func trackErrorSaveLinkEvent(error: String) {
        Analytics.logEvent("ErrorSaveLinkEvent", parameters: ["error": error])
    }
}
