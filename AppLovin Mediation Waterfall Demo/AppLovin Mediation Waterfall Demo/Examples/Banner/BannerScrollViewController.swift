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
    lazy var quotes = getQuotes()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareElements()
    }
    
    func prepareElements(){
        
        let cardHeight = 160.0
        var currentYPosition = 0.0
        let standarSpace = 8.0
        var cards: [Card] = []
        
        for iCont in 0..<quotes.count {
            if iCont == Int(quotes.count / 2) {
                adView = MAAdView(adUnitIdentifier: Banner.adUnitID)
                adView.delegate = self
                adView.frame = CGRect(x: 0, y: currentYPosition, width: 320, height: 50)
                adView.backgroundColor = UIColor.clear
                bannerScrollVew.addSubview(adView)
                
                adView.translatesAutoresizingMaskIntoConstraints = false
                adView.centerXAnchor.constraint(equalTo: bannerScrollVew.centerXAnchor).isActive = true
                let previousElement = iCont == 0 ? bannerScrollVew.topAnchor : cards[iCont-1].bottomAnchor
                adView.topAnchor.constraint(equalTo: previousElement, constant: standarSpace).isActive = true
                adView.widthAnchor.constraint(equalTo: bannerScrollVew.widthAnchor).isActive = true
                adView.heightAnchor.constraint(equalToConstant: 50).isActive = true
                
                currentYPosition += (adView.frame.height + standarSpace)
            }
            
            let card = Card(frame: CGRect(x: 0, y: 0, width: bannerScrollVew.frame.width, height: cardHeight))
            card.quote = quotes[iCont]
            
            bannerScrollVew.addSubview(card)
            cards.append(card)

            card.translatesAutoresizingMaskIntoConstraints = false
            card.centerXAnchor.constraint(equalTo: bannerScrollVew.centerXAnchor).isActive = true
            let previousElement = iCont == 0 ? bannerScrollVew.topAnchor : (Int(quotes.count / 2) == iCont ? adView.bottomAnchor : cards[iCont-1].bottomAnchor)
            card.topAnchor.constraint(equalTo: previousElement, constant: standarSpace).isActive = true
            card.widthAnchor.constraint(equalTo: bannerScrollVew.widthAnchor).isActive = true
            card.heightAnchor.constraint(equalToConstant: cardHeight).isActive = true
            
            currentYPosition += (card.frame.height + standarSpace)
        }
        
        bannerScrollVew.contentSize = CGSize(width: bannerScrollVew.frame.width, height: currentYPosition)
        hiddeDebugbutton(isHidden: true)
    }
    
    func hiddeDebugbutton(isHidden: Bool){
        debugButton.isHidden = isHidden
    }
    
    // MARK: - Actions
    
    @IBAction func loadBanner(_ sender: Any) {
        adView.loadAd()
        hiddeDebugbutton(isHidden: true)
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

// MARK: - Data

extension BannerScrollViewController {
    
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
                Quote(quoteText:"A hunted man sometimes wearies of distrust and longs for friendship." ,quoteAuthor:"J. R. R. Tolkien, The Lord of the Rings")]
    }
}
