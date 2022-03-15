// For AppLovin Mediation Banner integration, simply just follow AppLovin's documentation.
// AppLovinMediationVerveCustomNetworkAdapter that you've added to the project, will do all the work.
// You don't have to write any HyBid related code for this integration.

import UIKit
import AppLovinSDK

class Banner: UIViewController {
    
    @IBOutlet weak var bannerAdContainer: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var adView: MAAdView!
    let adUnitID = "fd30fd06782c6796"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "AppLovin Mediation Banner"
        
        adView = MAAdView(adUnitIdentifier: adUnitID)
        adView.delegate = self
        adView.frame = CGRect(x: 0, y: 0, width: bannerAdContainer.frame.size.width, height: bannerAdContainer.frame.size.height)
        adView.backgroundColor = UIColor.clear
        bannerAdContainer.addSubview(adView)
    }
    
    @IBAction func loadAdTouchUpInside(_ sender: UIButton) {
        activityIndicator.startAnimating()
        bannerAdContainer.isHidden = true
        adView.loadAd()
    }
    
}

extension Banner : MAAdViewAdDelegate {
    func didExpand(_ ad: MAAd) {}
    func didCollapse(_ ad: MAAd) {}
}

extension Banner : MAAdDelegate {
    func didLoad(_ ad: MAAd) {
        bannerAdContainer.isHidden = false
        activityIndicator.stopAnimating()
    }
    
    func didFailToLoadAd(forAdUnitIdentifier adUnitIdentifier: String, withError error: MAError) {
        activityIndicator.stopAnimating()
    }
    
    func didFail(toDisplay ad: MAAd, withError error: MAError) {
        activityIndicator.stopAnimating()
    }
    
    func didDisplay(_ ad: MAAd) {}
    func didHide(_ ad: MAAd) {}
    func didClick(_ ad: MAAd) {}
}
