// For AppLovin Mediation Rewarded integration, simply just follow AppLovin's documentation.
// AppLovinMediationVerveCustomNetworkAdapter that you've added to the project, will do all the work.
// You don't have to write any HyBid related code for this integration.

import UIKit
import AppLovinSDK

class Rewarded: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var showAdButton: UIButton!
    
    var rewardedAd: MARewardedAd!
    let adUnitID = "YOUR_AD_UNIT_ID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "AppLovin Mediation Rewarded"
    }
    
    @IBAction func loadAdTouchUpInside(_ sender: UIButton) {
        activityIndicator.startAnimating()
        showAdButton.isHidden = true
        rewardedAd = MARewardedAd.shared(withAdUnitIdentifier: adUnitID)
        rewardedAd.delegate = self
        rewardedAd.load()
    }
    
    @IBAction func showAdTouchUpInside(_ sender: UIButton) {
        if rewardedAd.isReady {
            rewardedAd.show()
        } else {
            print("Ad wasn't ready")
        }
    }
}

extension Rewarded : MAAdDelegate {
    func didLoad(_ ad: MAAd) {
        activityIndicator.stopAnimating()
        showAdButton.isHidden = false
    }
    
    func didFailToLoadAd(forAdUnitIdentifier adUnitIdentifier: String, withError error: MAError) {
        activityIndicator.stopAnimating()
    }
    
    func didFail(toDisplay ad: MAAd, withError error: MAError) {
        activityIndicator.stopAnimating()
    }
    
    func didHide(_ ad: MAAd) {
        showAdButton.isHidden = true
    }
    
    func didDisplay(_ ad: MAAd) {}
    func didClick(_ ad: MAAd) {}
}

extension Rewarded : MARewardedAdDelegate {
    func didStartRewardedVideo(for ad: MAAd) {}
    func didCompleteRewardedVideo(for ad: MAAd) {}
    func didRewardUser(for ad: MAAd, with reward: MAReward) {}
}
