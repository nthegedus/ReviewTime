//
//  HomeViewController.swift
//  ReviewTime
//
//  Created by Nathan Hegedus on 18/06/15.
//  Copyright (c) 2015 Nathan Hegedus. All rights reserved.
//

import UIKit
import TwitterKit

class HomeViewController: UIViewController {

    var timer: NSTimer?
    
    @IBOutlet weak var lastUpdateLabel: UILabel!
    
    @IBOutlet weak var iosTypeLabel: UILabel!
    @IBOutlet weak var iosDaysLabel: UILabel!
    @IBOutlet weak var iosDescriptionLabel: UILabel!
    
    @IBOutlet weak var macTypeLabel: UILabel!
    @IBOutlet weak var macDaysLabel: UILabel!
    @IBOutlet weak var macDescriptionLabel: UILabel!
    

    @IBOutlet weak var errorButton: UIButton!
    @IBOutlet weak var iosButton: NHButton!
    @IBOutlet weak var macButton: NHButton!
    @IBOutlet weak var extraInfoLabel: UILabel!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!

    var loginTwitterButton:TWTRLogInButton?
    var reviewTimeResult: ReviewTime? {
        didSet {
            self.iosDaysLabel.hidden = false
            self.iosDaysLabel.text = NSLocalizedString("\(reviewTimeResult!.iosAverageTime) days", comment: "Average Days")
            self.iosDescriptionLabel.text = NSLocalizedString("Based on \(reviewTimeResult!.iosTotalTweets) reviews in the last 14 days", comment: "Description reviews iOS")
            self.macDaysLabel.hidden = false
            self.macDaysLabel.text = NSLocalizedString("\(reviewTimeResult!.macAverageTime) days", comment: "Average Days")
            self.macDescriptionLabel.text = NSLocalizedString("Based on \(reviewTimeResult!.macTotalTweets) reviews in the last 30 days", comment: "Description reviews Mac")
            self.lastUpdateLabel.text = NSLocalizedString("last updated: \(reviewTimeResult!.lastUpdate)", comment: "Last update Label")
            self.activityIndicatorView.stopAnimating()
            self.fadeInLabels()
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.fetchData()
        self.logAnalytics()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "tweetMac", name: "Mac", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "tweetIOS", name: "iOS", object: nil)

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.timer?.invalidate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Private Methods
    
    private func logAnalytics() {
        
        var tracker = GAI.sharedInstance().defaultTracker
        tracker.set("HomeViewController", value: "Load_Home")
        
        var builder = GAIDictionaryBuilder.createScreenView()
        tracker.send(builder.build() as [NSObject : AnyObject])
        
    }
    
    internal func fetchData() {
        self.activityIndicatorView.startAnimating()
        ReviewTimeWS.fetchReviewTimeData { (reviewTime, error) -> Void in
            if error == nil {
                self.reviewTimeResult = reviewTime
                self.timer = NSTimer.scheduledTimerWithTimeInterval(30*60, target: self, selector: "fetchData", userInfo: nil, repeats: false)
            }else{
                self.activityIndicatorView.stopAnimating()
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.errorButton.alpha = 1.0
                })
            }
        }   
    }
    
    private func fadeInLabels() {
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.iosDaysLabel.alpha = 1.0
            self.iosTypeLabel.alpha = 1.0
            self.iosDescriptionLabel.alpha = 1.0
            self.macDaysLabel.alpha = 1.0
            self.macTypeLabel.alpha = 1.0
            self.macDescriptionLabel.alpha = 1.0
            self.lastUpdateLabel.alpha = 1.0
        })
    }
    
    private func tweetReviewTimeWithHashtag(hashtag: String) {
        
        if Twitter.sharedInstance().session() == nil {
            
            Twitter.sharedInstance().logInWithCompletion {
                (session, error) -> Void in
                if (session != nil) {
                    self.tweetReviewTimeWithHashtag(hashtag)
                }
                
            }
            
        }else{
            
            let composer = TWTRComposer()
            
            composer.setText(hashtag)
            
            composer.showFromViewController(self, completion: { (result) -> Void in
                if (result == TWTRComposerResult.Done) {
                    var tracker = GAI.sharedInstance().defaultTracker
                    tracker.set("Tweeted", value: "Tweeted_\(hashtag)")

                    log.debug("Tweeted")
                }
            })
             
        }

        
    }
    
    // MARK: - IBActions
    
    @IBAction func tryAgain(sender: AnyObject) {
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.errorButton.alpha = 0.0
            
        }) { (bool) -> Void in
            
            self.fetchData()
        }
        
    }
    

    @IBAction func tweetIOS() {
        
        var tracker = GAI.sharedInstance().defaultTracker
        tracker.set("Start Twitter for iOS hashtag", value: "Tweet_iOS")
        
        self.tweetReviewTimeWithHashtag("#iosreviewtime")
        
    }
    
    @IBAction func tweetMac( ) {
        
        var tracker = GAI.sharedInstance().defaultTracker
        tracker.set("Start Twitter for Mac hashtag", value: "Tweet_Mac")
        
        self.tweetReviewTimeWithHashtag("#macreviewtime")
        
    }
    
    @IBAction func openInfo(sender: AnyObject) {

        let title = NSLocalizedString("Where does this data come from?", comment: "Title alert about")
        let message = NSLocalizedString("This is not official Apple data. It is based only on anecdotal data gathered from people posting their latest review times on Twitter and App.net using the #macreviewtime or #iosreviewtime hash tags.", comment: "Message alert about")
        
        UIAlertView(title: title, message: message, delegate: nil, cancelButtonTitle: "Ok").show()
        
    }
    
    

    

}
