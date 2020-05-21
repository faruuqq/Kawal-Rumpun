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
    override func viewDidLoad() {
        super.viewDidLoad()
        //Asume we have the user already logged in
        if UserDefaults.standard.string(forKey: "id_warga")?.isEmpty {
            currentIdWarga = "test"
        } else {
            currentIdWarga = UserDefaults.standard.string(forKey: "id_warga")
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
