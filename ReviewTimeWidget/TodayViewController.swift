//
//  TodayViewController.swift
//  ReviewTimeWidget
//
//  Created by Nathan Hegedus on 09/06/15.
//  Copyright (c) 2015 Nathan Hegedus. All rights reserved.
//

import UIKit
import NotificationCenter
import XCGLogger

let log = XCGLogger.defaultInstance()

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet weak var lastUpdateLabel: UILabel!
    @IBOutlet weak var iosTypeLabel: UILabel!
    @IBOutlet weak var iosDaysLabel: UILabel!
    @IBOutlet weak var macTypeLabel: UILabel!
    @IBOutlet weak var macDaysLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var errorButton: UIButton!
    @IBOutlet weak var iosButton: NHButton!
    @IBOutlet weak var macButton: NHButton!
    
    var reviewTimeResult: ReviewTime? {
        didSet {
            self.iosDaysLabel.hidden = false
            self.iosDaysLabel.text = "\(reviewTimeResult!.iosAverageTime) days"
            self.macDaysLabel.hidden = false
            self.macDaysLabel.text = "\(reviewTimeResult!.macAverageTime) days"
            self.lastUpdateLabel.text = "last updated: \(reviewTimeResult!.lastUpdate)"
            self.fadeInLabels()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        self.fetchData()
        self.preferredContentSize = CGSizeMake(self.view.frame.size.width, 120)
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //self.iosContentView.layer.cornerRadius = self.iosContentView.frame.size.width/2
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetMarginInsetsForProposedMarginInsets(defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets {
        var margins = UIEdgeInsets(top: 5, left: 10, bottom: 10, right: 10)
        return margins
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        completionHandler(NCUpdateResult.NewData)
    }
    
    // MARK: - IBActions
    
    @IBAction func tweetIOS() {
        self.openUrlWithUrlString("RTUrlType://iOS")
    }
    
    @IBAction func tweetMac() {
        self.openUrlWithUrlString("RTUrlType://Mac")
    }
    
    
    @IBAction func tryAgain(sender: AnyObject) {
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.errorButton.alpha = 0.0
            
            }) { (bool) -> Void in
                
                self.fetchData()
        }
        
    }
    
    
    // MARK: - Private Methods
    
    private func fetchData() {
        self.lastUpdateLabel.text = "Loading..."
        ReviewTimeWS.fetchReviewTimeData { (reviewTime, error) -> Void in
            if error == nil {
                self.reviewTimeResult = reviewTime
            }else{
                self.fadeOutLabels()
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.errorButton.alpha = 1.0
                })
            }
            
        }
    }
    
    private func fadeInLabels() {
        self.preferredContentSize = CGSizeMake(self.view.frame.size.width, 220)
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.iosDaysLabel.alpha = 1.0
            self.iosTypeLabel.alpha = 1.0
            self.macDaysLabel.alpha = 1.0
            self.macTypeLabel.alpha = 1.0
        })
    }
    
    private func fadeOutLabels() {
        self.lastUpdateLabel.text = ""
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.iosDaysLabel.alpha = 0.0
            self.iosTypeLabel.alpha = 0.0
            self.macDaysLabel.alpha = 0.0
            self.macTypeLabel.alpha = 0.0
        })
        
    }
    
    private func openUrlWithUrlString(urlString: String) {
        self.extensionContext?.openURL(NSURL(string: urlString)!, completionHandler: nil)
    }

}
