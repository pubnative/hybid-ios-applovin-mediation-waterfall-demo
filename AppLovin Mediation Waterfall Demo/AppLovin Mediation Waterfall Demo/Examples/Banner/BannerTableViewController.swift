//
//  BannerTableViewController.swift
//  AppLovin Mediation Waterfall Demo
//
//  Created by José Jacobo Contreras Trejo on 26.10.22.
//

import UIKit
import AppLovinSDK

protocol SetBannerState {
    func setState(state: BannerState)
    func setBanner(banner: MAAdView)
}

class BannerTableViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var quotesTableView: UITableView!
    @IBOutlet weak var debugButton: UIButton!
    
    // MARK: - Variables
    lazy var quotes = getQuotes()
    var adView: MAAdView!
    var bannerDelegate: SetBannerState?
    var bannerState: BannerState = .initialized {
        didSet{
            switch(bannerState){
            case .initialized:
                bannerDelegate?.setState(state: bannerState)
                hiddeDebugbutton(isHidden: true)
            case .loading:
                bannerDelegate?.setState(state: bannerState)
                hiddeDebugbutton(isHidden: true)
            case .loaded:
                bannerDelegate?.setState(state: bannerState)
                hiddeDebugbutton(isHidden: false)
            case .failed:
                bannerDelegate?.setState(state: bannerState)
                hiddeDebugbutton(isHidden: false)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareBanner()
    }
    
    func prepareBanner(){
        adView = MAAdView(adUnitIdentifier: Banner.adUnitID)
        adView.delegate = self
        adView.frame = CGRect(x: 0, y: 0, width: 320, height: 50)
        adView.backgroundColor = UIColor.clear
        bannerDelegate?.setBanner(banner: adView)
        bannerState = .initialized
    }
    
    func hiddeDebugbutton(isHidden: Bool){
        debugButton.isHidden = isHidden
    }
    

// MARK: - Actions
    
    @IBAction func loadBanner(_ sender: Any) {
        adView.loadAd()
        bannerState = .loading
    }
}

extension BannerTableViewController: MAAdViewAdDelegate {
    
    func didLoad(_ ad: MAAd) {
        bannerState = .loaded
    }
    
    func didFailToLoadAd(forAdUnitIdentifier adUnitIdentifier: String, withError error: MAError) {
        bannerState = .failed
    }
    
    func didFail(toDisplay ad: MAAd, withError error: MAError) {
        bannerState = .failed
    }
    
    func didDisplay(_ ad: MAAd) {}
    
    func didHide(_ ad: MAAd) {}
    
    func didClick(_ ad: MAAd) {}
    
    func didExpand(_ ad: MAAd) {}
    
    func didCollapse(_ ad: MAAd) {}
}

// MARK: - Table View

extension BannerTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let quoteCell = tableView.dequeueReusableCell(withIdentifier: "quoteCell") as? QuoteTableViewCell else {
            return UITableViewCell()
        }
        
        guard let bannerCell = tableView.dequeueReusableCell(withIdentifier: "bannerCell") as? BannerTableViewCell else {
            return UITableViewCell()
        }
        
        let quote = quotes[indexPath.row]

        if quote.quoteText == "" {
            bannerDelegate = bannerCell
            bannerDelegate?.setBanner(banner: adView)
            bannerDelegate?.setState(state: bannerState)
            
            return bannerCell
        } else {
            quoteCell.quoteText.text = quote.quoteText
            quoteCell.quoteAuthor.text = quote.quoteAuthor
            
            return quoteCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let quote = quotes[indexPath.row]
        
        if quote.quoteText == "" {
            return (adView?.frame.height ?? -40) + 40
        } else {
            return 100
        }
    }
}

// MARK: - Data


extension BannerTableViewController {
    
    func getQuotes() -> [Quote] {
        return [Quote(quoteText:"Our world is built on biology and once we begin to understand it, it then becomes a technology" ,quoteAuthor:"Ryan Bethencourt"),
                Quote(quoteText:"Happiness is not an ideal of reason but of imagination" ,quoteAuthor:"Immanuel Kant"),
                Quote(quoteText:"Science and technology revolutionize our lives, but memory, tradition and myth frame our response." ,quoteAuthor:"Arthur M. Schlesinger"),
                Quote(quoteText:"It's not a faith in technology. It's faith in people" ,quoteAuthor:"Steve Jobs"),
                Quote(quoteText:"We can't blame the technology when we make mistakes." ,quoteAuthor:"Tim Berners-Lee"),
                Quote(quoteText:"Life must be understood backward. But it must be lived forward." ,quoteAuthor:"Søren Kierkegaard"),
                Quote(quoteText:"Happiness can be found, even in the darkest of times, if one only remembers to turn on the light." ,quoteAuthor:"Albus Dumbledore"),
                Quote(quoteText:"To live a creative life, we must lose our fear of being wrong." ,quoteAuthor:"Joseph Chilton Pearce"),
                Quote(quoteText:"It is undesirable to believe a proposition when there is no ground whatever for supposing it true." ,quoteAuthor:"Bertrand Russell"),
                Quote(quoteText:"There's always a bigger fish." ,quoteAuthor:"Qui-Gon Jinn"),
                Quote(quoteText:"A wizard is never late. Nor is he early. He arrives precisely when he means to." ,quoteAuthor:"Gandalf"),
                Quote(quoteText:"Moonlight drowns out all but the brightest stars." ,quoteAuthor:"J. R. R. Tolkien, The Lord of the Rings"),
                Quote(quoteText:"A hunted man sometimes wearies of distrust and longs for friendship." ,quoteAuthor:"J. R. R. Tolkien, The Lord of the Rings"),
                Quote(quoteText: "", quoteAuthor: "")]
    }
}

