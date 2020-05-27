//
//  HealtchCheckLabelTVCell.swift
//  KawalRumpunExperiment
//
//  Created by Rais Mohamad Najib on 27/05/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import UIKit

class HealtchCheckLabelTVCell: UITableViewCell {
    

    @IBOutlet weak var tickBackground: UIView!
    @IBOutlet weak var healtchCheckListLabel: UILabel!
    @IBOutlet weak var tickImageView: UIImageView!
    static let reusableidentifier = String(describing: HealtchCheckLabelTVCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        healtchCheckListLabel.adjustsFontSizeToFitWidth = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
