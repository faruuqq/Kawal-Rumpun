//
//  HeaderGugusCell.swift
//  KawalRumpunExperiment
//
//  Created by Firza Ilhami on 24/05/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import UIKit

protocol PhoneCallDelegate: class {
    func makePhoneCall(phoneNumber: String)
}

class GugusCovidCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    var orang: People!
    
    weak var delegate: PhoneCallDelegate?
    
    func setPeople(_ people: People) {
        orang = people
        cellLabel.text = orang.name
    }
    
    @IBAction func callTapped(_ sender: UIButton) {
        self.delegate?.makePhoneCall(phoneNumber: orang.phoneNumber)
    }
    
}
