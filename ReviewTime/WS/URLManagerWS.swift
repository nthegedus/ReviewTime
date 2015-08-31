//
//  URLManagerWS.swift
//  ReviewTime
//
//  Created by Nathan Hegedus on 28/08/15.
//  Copyright (c) 2015 Nathan Hegedus. All rights reserved.
//

import UIKit

enum UrlRequestType: String {
    case iOS = "bwmso8jg"
    case Mac = "czcf5ge6"
    case ShortData = "6pwwyjdy"
}

class URLManagerWS: NSObject {
   
    static var url = "https://www.kimonolabs.com/api/"
    static var apiKey = "?apikey=MGKzHaqx4RETL4rx4pvIxO7JLvBrBMo3"
    static var macUrlSufix = "czcf5ge6?apikey=MGKzHaqx4RETL4rx4pvIxO7JLvBrBMo3"
    static var shorDataSufix = "6pwwyjdy?apikey=MGKzHaqx4RETL4rx4pvIxO7JLvBrBMo3"
    static var iosCode = "bwmso8jg?apikey=MGKzHaqx4RETL4rx4pvIxO7JLvBrBMo3"

    
    // MARK: - Public Static Methods
    
    class func createURL(requestType: UrlRequestType) -> String {
        
        return self.url + requestType.rawValue + apiKey
        
    }
}
