//
//  QuoteTableViewCell.swift
//  AppLovin Mediation Waterfall Demo
//
//  Created by José Jacobo Contreras Trejo on 26.10.22.
//

import UIKit

class QuoteTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var quoteText: UILabel!
    @IBOutlet weak var quoteAuthor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
