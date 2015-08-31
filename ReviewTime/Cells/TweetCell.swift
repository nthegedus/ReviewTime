//
//  TweetCell.swift
//  ReviewTime
//
//  Created by Nathan Hegedus on 02/06/15.
//  Copyright (c) 2015 Nathan Hegedus. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tweetMessageLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(tweet: Tweet) {
        self.usernameLabel.text = tweet.username
        self.tweetMessageLabel.text = tweet.message
        self.tweetMessageLabel.numberOfLines = 10
        
        
    
    }
    
}
