// For AppLovin Mediation Banner integration, simply just follow AppLovin's documentation.
// AppLovinMediationVerveCustomNetworkAdapter that you've added to the project, will do all the work.
// You don't have to write any HyBid related code for this integration.

import UIKit
import AppLovinSDK

class Banner: UIViewController {
    
    @IBOutlet weak var bannerAdContainer: UIView!
    @IBOutlet weak var debugButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var adView: MAAdView!
    static let adUnitID = "fd30fd06782c6796"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adView = MAAdView(adUnitIdentifier: Banner.adUnitID)
        adView.delegate = self
        adView.frame = CGRect(x: 0, y: 0, width: bannerAdContainer.frame.size.width, height: bannerAdContainer.frame.size.height)
        adView.backgroundColor = UIColor.clear
        bannerAdContainer.addSubview(adView)
        hiddeDebugbutton(isHidden: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        adView.removeFromSuperview()
    }
    
    func hiddeDebugbutton(isHidden: Bool){
        debugButton.isHidden = isHidden
    }
    
    @IBAction func loadAdTouchUpInside(_ sender: UIButton) {
        activityIndicator.startAnimating()
        bannerAdContainer.isHidden = true
        adView.loadAd()
        hiddeDebugbutton(isHidden: true)
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
        hiddeDebugbutton(isHidden: false)
    }
    
    func didFailToLoadAd(forAdUnitIdentifier adUnitIdentifier: String, withError error: MAError) {
        activityIndicator.stopAnimating()
        hiddeDebugbutton(isHidden: false)
    }
    
    func didFail(toDisplay ad: MAAd, withError error: MAError) {
        activityIndicator.stopAnimating()
        hiddeDebugbutton(isHidden: false)
    }
    
    func didDisplay(_ ad: MAAd) {}
    func didHide(_ ad: MAAd) {}
    func didClick(_ ad: MAAd) {}
}
