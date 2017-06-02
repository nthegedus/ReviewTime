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

        return request(.GET, URLManagerWS.createURL(.ShortData), parameters: nil).responseJSON { response in
            var reviewTime: ReviewTime?
            if let JSON = response.result.value {
                reviewTime = ModelConverter.parseData(JSON as! Dictionary<String, AnyObject>)
            }
            completion?(reviewTime, nil)
        }

    }
    
}
