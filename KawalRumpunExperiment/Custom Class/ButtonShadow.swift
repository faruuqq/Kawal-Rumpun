//
//  ButtonShadow.swift
//  KawalRumpunExperiment
//
//  Created by Muhammad Faruuq Qayyum on 20/05/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import UIKit

@IBDesignable
class ButtonShadow: UIButton {
    
    @IBInspectable var ShadowColor: UIColor = UIColor.clear {
        didSet {
            layer.shadowColor = ShadowColor.cgColor
        }
    }
    
    @IBInspectable var ShadowRadius: CGFloat = 0 {
        didSet {
            layer.shadowRadius = ShadowRadius
        }
    }
    
    @IBInspectable var ShadowOpacity: Float = 0 {
        didSet {
            layer.shadowOpacity = ShadowOpacity
        }
    }
    
    @IBInspectable var ShadowOffset: CGSize = CGSize(width: 0, height: 0) {
        didSet {
            layer.shadowOffset = ShadowOffset
        }
    }
    
}
