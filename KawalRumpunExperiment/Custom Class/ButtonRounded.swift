//
//  ButtonRounded.swift
//  KawalRumpunExperiment
//
//  Created by Muhammad Faruuq Qayyum on 20/05/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import UIKit

@IBDesignable

class ButtonRounded: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

}
