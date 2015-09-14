//
//  ReviewTime.swift
//  ReviewTime
//
//  Created by Nathan Hegedus on 05/06/15.
//  Copyright (c) 2015 Nathan Hegedus. All rights reserved.
//

import UIKit

class ReviewTime: NSObject {
    
    struct Hashtag {
        static let ios = "#iosreviewtime"
        static let mac = "#macreviewtime"
    }
    
    var version: NSNumber!
    var lastUpdate: String!
    
    var iosTweets: Array <Tweet>?
    var iosAverageTime: Int!
    var iosHashtag: String!
    var iosTotalTweets: Int!
    
    var macTweets: Array <Tweet>?
    var macAverageTime: Int!
    var macHashtag: String!
    var macTotalTweets: Int!
    
}
