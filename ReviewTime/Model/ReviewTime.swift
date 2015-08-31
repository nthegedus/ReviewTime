//
//  ReviewTime.swift
//  ReviewTime
//
//  Created by Nathan Hegedus on 05/06/15.
//  Copyright (c) 2015 Nathan Hegedus. All rights reserved.
//

import UIKit

enum Hashtag: String {
    
    case ios = "iOS"
    case mac = "Mac"
    
    func hashtagName() -> String {
        switch self {
        case .ios:
            return "iosreviewtime"
        case .mac:
            return "macreviewtime"
        }
    }
    
}

class ReviewTime: NSObject {
    
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
