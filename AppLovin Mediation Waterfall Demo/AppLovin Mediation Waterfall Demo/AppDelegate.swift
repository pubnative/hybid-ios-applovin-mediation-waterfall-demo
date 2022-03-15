//
//  AppDelegate.swift
//  AppLovin Mediation Waterfall Demo
//
//  Created by Can Soykarafakili on 11.03.22.
//

import UIKit
// Step 1: Import HyBid into your class (Only required if anything in Step 4 below is set)
import HyBid
// Step 2: Import AppLovin SDK into your class
import AppLovinSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
        
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Step 3: Setup & Initialize AppLovin SDK
        let settings = ALSdkSettings()

        // Optional: Enable built in User Consent Flow
        settings.consentFlowSettings.isEnabled = true
        settings.consentFlowSettings.privacyPolicyURL = URL(string: "https://verve.com/product-privacy-policies/")
        settings.consentFlowSettings.termsOfServiceURL = URL(string: "https://verve.com/publisher-content-guidelines/")
    
        let sdk = ALSdk.shared(with: settings)!
        
        // Please make sure to set the mediation provider value to "max" to ensure proper functionality
        sdk.mediationProvider = "max"
        sdk.initializeSdk { (configuration: ALSdkConfiguration) in }

        // Step 4: Optional Verve HyBid SDK settings
        // Set COPPA (Optional)
        HyBid.setCoppa(false)
        // Test Mode (Optional)
        HyBid.setTestMode(false)
        // Location Tracking (Optional)
        HyBid.setLocationTracking(true)
        // HTML/MRAID Interstitial skipOffset (Optional)
        HyBid.setHTMLInterstitialSkipOffset(2)
        // Video Interstitial skipOffset (Optional)
        HyBid.setVideoInterstitialSkipOffset(5)
        // Custom Click Behavior (Optional)
        HyBid.setInterstitialActionBehaviour(HB_CREATIVE)
        // 1st party user data Targeting (Optional)
        let targeting = HyBidTargetingModel()
        targeting.age = 28
        targeting.interests = ["music"]
        targeting.gender = "f"     // "f" for female, "m" for male
        HyBid.setTargeting(targeting)
        // Set HyBid log level (Optional)
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

