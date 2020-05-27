//
//  TableHealtchCheckVController.swift
//  KawalRumpunExperiment
//
//  Created by Rais Mohamad Najib on 27/05/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import UIKit
import Foundation

class TableHealtchCheckVController {

    var healthCheckStatusLabel : String = ""
    var healthCheckStatus : Bool = false
    init(healthCheckStatusLabel: String, healthCheckStatus: Bool) {
        self.healthCheckStatus = healthCheckStatus
        self.healthCheckStatusLabel = healthCheckStatusLabel
    }
    
    struct HealthCheckReportModel {
    var id_warga = ""
    var healthCheckItemArray = [TableHealtchCheckVController]()
    var bodyTemperature : TableHealtchCheckVController
    var cough : TableHealtchCheckVController
    var flu : TableHealtchCheckVController
    var fever : TableHealtchCheckVController
    var throatPain : TableHealtchCheckVController
    var breath: TableHealtchCheckVController
    var symptomp : TableHealtchCheckVController
    
    init() {
        
        //Body temp
        bodyTemperature = TableHealtchCheckVController(healthCheckStatusLabel: "Body Temperature > 37.5 C", healthCheckStatus: true)
        
        //Cough
        cough = TableHealtchCheckVController(healthCheckStatusLabel: "Cough", healthCheckStatus: false)
        //Flu
        flu = TableHealtchCheckVController(healthCheckStatusLabel: "Flu", healthCheckStatus: false)
        //Fever
        fever = TableHealtchCheckVController(healthCheckStatusLabel: "Fever", healthCheckStatus: false)
        //Throat Pain
        throatPain = TableHealtchCheckVController(healthCheckStatusLabel: "Throat Pain", healthCheckStatus: false)
        //Shortness of breath
        breath = TableHealtchCheckVController(healthCheckStatusLabel: "Shortness of Breath", healthCheckStatus: false)
        //are The Syptomps repidly worsening
        symptomp = TableHealtchCheckVController(healthCheckStatusLabel: "Are the syptomps rapidly worsening?", healthCheckStatus: false)

        
        healthCheckItemArray.append(bodyTemperature)
        healthCheckItemArray.append(cough)
        healthCheckItemArray.append(flu)
        healthCheckItemArray.append(fever)
        healthCheckItemArray.append(throatPain)
        healthCheckItemArray.append(breath)
        healthCheckItemArray.append(symptomp)
    }
    
    
    
    
    
    
    
    
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
}
