//
//  GuestFirstVC.swift
//  KawalRumpunExperiment
//
//  Created by Muhammad Fawwaz Mayda on 21/05/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import UIKit

class GuestFirstVC: UIViewController {

    
    @IBOutlet weak var tamuTextField: UITextField!
    
    @IBOutlet weak var periodeTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        tamuTextField.text = "0"
        periodeTextField.text = "0"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tamuStepperTapped(_ sender: UIStepper) {
        tamuTextField.text = "\(Int(sender.value))"
    }
    
    @IBAction func periodeSteppedTapped(_ sender: UIStepper) {
        periodeTextField.text = "\(Int(sender.value))"
    }
    
    
}
