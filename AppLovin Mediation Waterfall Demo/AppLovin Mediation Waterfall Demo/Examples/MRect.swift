// For AppLovin Mediation MRect integration, simply just follow AppLovin's documentation.
// AppLovinMediationVerveCustomNetworkAdapter that you've added to the project, will do all the work.
// You don't have to write any HyBid related code for this integration.

import UIKit
import AppLovinSDK

class MRect: UIViewController {
    
    @IBOutlet weak var mRectAdContainer: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var adView: MAAdView!
    let adUnitID = "YOUR_AD_UNIT_ID"

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "AppLovin Mediation MRect"
        
        adView = MAAdView(adUnitIdentifier: adUnitID)
        adView.delegate = self
        adView.frame = CGRect(x: 0, y: 0, width: mRectAdContainer.frame.size.width, height: mRectAdContainer.frame.size.height)
        adView.backgroundColor = UIColor.clear
        mRectAdContainer.addSubview(adView)
    }
    
    @IBAction func loadAdTouchUpInside(_ sender: UIButton) {
        activityIndicator.startAnimating()
        mRectAdContainer.isHidden = true
        adView.loadAd()
    }

}

extension MRect : MAAdViewAdDelegate {
    func didExpand(_ ad: MAAd) {}
    func didCollapse(_ ad: MAAd) {}
}

extension MRect : MAAdDelegate {
    func didLoad(_ ad: MAAd) {
        mRectAdContainer.isHidden = false
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
