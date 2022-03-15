// For AppLovin Mediation Interstitial integration, simply just follow AppLovin's documentation.
// AppLovinMediationVerveCustomNetworkAdapter that you've added to the project, will do all the work.
// You don't have to write any HyBid related code for this integration.

import UIKit
import AppLovinSDK

class Interstitial: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var showAdButton: UIButton!
    
    var interstitialAd: MAInterstitialAd!
    let adUnitID = "2cc94ba50f6c04a9"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "AppLovin Mediation Interstitial"
    }
    
    @IBAction func loadAdTouchUpInside(_ sender: UIButton) {
        activityIndicator.startAnimating()
        showAdButton.isHidden = true
        interstitialAd = MAInterstitialAd(adUnitIdentifier: adUnitID)
        interstitialAd.delegate = self
        interstitialAd.load()
    }
    
    @IBAction func showAdTouchUpInside(_ sender: UIButton) {
        if interstitialAd.isReady {
            interstitialAd.show()
        } else {
            print("Ad wasn't ready")
        }
    }
}

extension Interstitial : MAAdDelegate {
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
