//
//  HealthCheckCell.swift
//  KawalRumpunExperiment
//
//  Created by Muhammad Fawwaz Mayda on 23/05/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import UIKit

class HealthCheckCell: UITableViewCell {
    @IBOutlet weak var tickBackground : UIView!
    @IBOutlet weak var healthCheckListLabel: UILabel!
    @IBOutlet weak var tickImageView: UIImageView!
    static let reuseIdentifier = String(describing: HealthCheckCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        healthCheckListLabel.adjustsFontSizeToFitWidth = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
