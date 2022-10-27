//
//  BannerTableViewCell.swift
//  AppLovin Mediation Waterfall Demo
//
//  Created by José Jacobo Contreras Trejo on 26.10.22.
//

import UIKit
import AppLovinSDK

enum BannerState {
    case initialized
    case loading
    case loaded
    case failed
}

class BannerTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var bannerContainerView: UIView!
    @IBOutlet weak var bannerLoader: UIActivityIndicatorView!
    
    //MARK: - Variables
    var state: BannerState! = .initialized {
        didSet {
            print("************** estado ", state)
            switch(state){
            case .initialized:
                bannerContainerView.isHidden = true
                bannerLoader.isHidden = true
            case .loading:
                bannerContainerView.isHidden = false
                bannerLoader.isHidden = false
                bannerLoader.startAnimating()
            case .loaded:
                bannerContainerView.isHidden = false
                bannerLoader.isHidden = true
                bannerLoader.stopAnimating()
            case .failed:
                bannerContainerView.isHidden = true
                bannerLoader.isHidden = true
                bannerLoader.stopAnimating()
            case .none:
                bannerContainerView.isHidden = true
                bannerLoader.isHidden = true
                bannerLoader.stopAnimating()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension BannerTableViewCell: SetBannerState {
    
    func setState(state: BannerState) {
        self.state = state
    }
    
    func setBanner(banner: MAAdView){
        self.bannerContainerView.addSubview(banner)
    }
}
