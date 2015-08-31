//
//  ReviewTimeWS.swift
//  ReviewTime
//
//  Created by Nathan Hegedus on 05/06/15.
//  Copyright (c) 2015 Nathan Hegedus. All rights reserved.
//

import UIKit
import Alamofire

class ReviewTimeWS: NSObject {

    class func fetchReviewTimeData(completion: ((ReviewTime?, NSError?) -> Void)?) -> Request {
        
        return request(.GET, "\(URLManagerWS.createURL(.ShortData))", parameters: nil).responseJSON(options: NSJSONReadingOptions.AllowFragments) { (request, response, data, responseError) -> Void in
            var reviewTime: ReviewTime?
            if responseError == nil {
                reviewTime = ModelConverter.parseData(data as! Dictionary<String, AnyObject>)
            }
            completion?(reviewTime, responseError)
        }

    }
    
}
