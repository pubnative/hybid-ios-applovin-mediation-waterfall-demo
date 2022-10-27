//
//  BannerScrollViewController.swift
//  AppLovin Mediation Waterfall Demo
//
//  Created by José Jacobo Contreras Trejo on 27.10.22.
//

import UIKit
import AppLovinSDK

class BannerScrollViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var debugButton: UIButton!
    @IBOutlet weak var bannerScrollVew: UIScrollView!
    
    // MARK: - Variables
    var adView: MAAdView!
    var elements: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareElements()
    }
    
    func prepareElements(){
        
        let elementSize = CGSize(width: self.view.frame.width, height: self.view.frame.height / 2)
        
        let firstView = UIView(frame: CGRect(x: 0, y: 0, width: elementSize.width, height: elementSize.height))
        
        let gradientFirstView = CAGradientLayer()
        gradientFirstView.frame = firstView.bounds
        gradientFirstView.colors = [#colorLiteral(red: 0.279373616, green: 0.6034608483, blue: 0.7308723927, alpha: 1).cgColor, UIColor.white.cgColor]
        firstView.layer.insertSublayer(gradientFirstView, at: 0)
        
        adView = MAAdView(adUnitIdentifier: Banner.adUnitID)
        adView.delegate = self
        adView.frame = CGRect(x: 0, y: firstView.frame.height, width: 320, height: 50)
        adView.backgroundColor = UIColor.clear
        
        let secondView = UIView(frame: CGRect(x: 0, y: firstView.frame.height + adView.frame.height, width: elementSize.width, height: elementSize.height))
        
        let gradientSecondView = CAGradientLayer()
        gradientSecondView.frame = secondView.bounds
        gradientSecondView.colors = [UIColor.white.cgColor, #colorLiteral(red: 0.279373616, green: 0.6034608483, blue: 0.7308723927, alpha: 1).cgColor]
        secondView.layer.insertSublayer(gradientSecondView, at: 0)
        
        bannerScrollVew.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        
        bannerScrollVew.addSubview(firstView)
        bannerScrollVew.addSubview(adView)
        bannerScrollVew.addSubview(secondView)
        
        hiddeDebugbutton(isHidden: true)
    }
    
    func hiddeDebugbutton(isHidden: Bool){
        debugButton.isHidden = isHidden
    }
    
    // MARK: - Actions
    
    @IBAction func loadBanner(_ sender: Any) {
        adView.loadAd()
    }
}

// MARK: - Banner delegate

extension BannerScrollViewController: MAAdViewAdDelegate {
    
    func didLoad(_ ad: MAAd) {
        hiddeDebugbutton(isHidden: false)
    }
    
    func didFailToLoadAd(forAdUnitIdentifier adUnitIdentifier: String, withError error: MAError) {
        hiddeDebugbutton(isHidden: false)
    }
    
    func didFail(toDisplay ad: MAAd, withError error: MAError) {
        hiddeDebugbutton(isHidden: false)
    }
    
    func didDisplay(_ ad: MAAd) {}
    
    func didHide(_ ad: MAAd) {}
    
    func didClick(_ ad: MAAd) {}
    
    func didExpand(_ ad: MAAd) {}
    
    func didCollapse(_ ad: MAAd) {}
}


