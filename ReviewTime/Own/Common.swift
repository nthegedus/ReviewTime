//
//  Common.swift
//
//  Created by Nathan Hegedus on 3/19/15.
//  Copyright (c) 2015 Nathan Hegedus. All rights reserved.
//

import UIKit
import Fabric
import TwitterKit
import Crashlytics

//  MARK: - Colors
let colorDarkGray = UIColor(hexa: "#242424", alpha: 1.0)
let colorGray = UIColor(hexa: "#323232", alpha: 1.0)
let colorLightGray = UIColor(hexa: "#C6C5C5", alpha: 1.0)


//  MARK: - Fonts
    //  MARK: London
let fontLondonMM = "LondonMM"
let fontLondonBetween = "LondonBetween"
let fontLondonTwo = "LondonTwo"


class Common {
    
    // MARK: - Appearance
    class func configureAppearance() {
        var colorImage = UIImage.imageWithColor(color: colorDarkGray)
        UINavigationBar.appearance().setBackgroundImage(colorImage, forBarMetrics: UIBarMetrics.Default)
        UIApplication.sharedApplication().statusBarStyle = .LightContent
    }
    
    // MARK: - Fabric
    class func configureFabric() {
        Fabric.with([Crashlytics(), Twitter()])
    }
    
    // MARK: - Google Analytics
    class func configureGoogleAnalytics() {
        GAI.sharedInstance().trackerWithTrackingId("UA-65261901-1")
        GAI.sharedInstance().trackUncaughtExceptions = true
        GAI.sharedInstance().dispatchInterval = 20.0
        GAI.sharedInstance().logger.logLevel = GAILogLevel.Error
        GAI.sharedInstance().defaultTracker.allowIDFACollection = true
        GAI.sharedInstance().defaultTracker.send(GAIDictionaryBuilder.createEventWithCategory("UI_Action", action: "App_Launched", label: "Launch", value: nil).build()  as [NSObject : AnyObject])
    }
    
    class func saveCurrentVersion() {
        
        let appName: String = (NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleDisplayName") as? String)!
        let version: String = (NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString") as? String)!
        let build: String = (NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleVersion") as? String)!
        log.debug("\n\n==================\nApp: \(appName)\nVersion: \(version)\nBuild: \(build)\n==================\n\n")
        
        NSUserDefaults.standardUserDefaults().setObject("\(version) (\(build))", forKey: "version_build_preference")
        
    }

}
