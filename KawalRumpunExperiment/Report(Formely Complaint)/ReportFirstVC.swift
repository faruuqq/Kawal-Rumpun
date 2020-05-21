//
//  ReportFirstVC.swift
//  KawalRumpunExperiment
//
//  Created by Muhammad Fawwaz Mayda on 21/05/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import UIKit

struct ReportModel {
    var keluhanType = ""
    var complaintText = ""
}
class ReportFirstVC: UIViewController {
    var currentIdWarga = ""
    @IBOutlet weak var kesehatanButton: UIButton!
    
    @IBOutlet weak var fasilitasButton: UIButton!
    
    @IBOutlet weak var sosialButton: UIButton!
    @IBOutlet weak var selanjutnyaButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Asume we have the user already logged in
        if let userDefaultsIdWarga = UserDefaults.standard.string(forKey: "id_warga") {
            if userDefaultsIdWarga.isEmpty {
                currentIdWarga = "dummy_id_warga"
            } else {
                currentIdWarga = userDefaultsIdWarga
            }
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func reportTypeButtonTapped(_ sender: UIButton) {
        print(sender.titleLabel?.text)
    }
    
}
