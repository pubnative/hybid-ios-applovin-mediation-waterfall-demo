//
//  AppDelegate.swift
//  AppLovin Mediation Waterfall Demo
//
//  Created by Can Soykarafakili on 11.03.22.
//

import UIKit
// Step 1: Import HyBid into your class
import HyBid
// Step 2: Import AppLovin SDK into your class
import AppLovinSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
        
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
// Step 3: Setup & Initialize AppLovin SDK
        ALSdk.shared()!.mediationProvider = "max"
        ALSdk.shared()!.userIdentifier = "USER_ID"
        ALSdk.shared()!.initializeSdk { (configuration: ALSdkConfiguration) in }
// Step 4: Set COPPA (Optional)
        HyBid.setCoppa(false)
// Step 5: Set Test Mode (Optional)
        HyBid.setTestMode(true)
// Step 6: Set Location Tracking (Optional)
        HyBid.setLocationTracking(true)
// Step 7: Set HTML Interstitial skipOffset (Optional)
        HyBid.setHTMLInterstitialSkipOffset(2)
// Step 8: Set Video Interstitial skipOffset (Optional)
        HyBid.setVideoInterstitialSkipOffset(5)
// Step 9: Set Custom Click Behavior (Optional)
        HyBid.setInterstitialActionBehaviour(HB_CREATIVE)
// Step 10: Set Targeting (Optional)
        let targeting = HyBidTargetingModel()
        targeting.age = 28
        targeting.interests = ["music"]
        targeting.gender = "f"     // "f" for female, "m" for male
        HyBid.setTargeting(targeting)
// Step 11: Set HyBid log level (Optional)
        HyBidLogger.setLogLevel(HyBidLogLevelDebug)
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
}

