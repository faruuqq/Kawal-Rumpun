//
//  HealthCheckUtil.swift
//  KawalRumpunExperiment
//
//  Created by Muhammad Fawwaz Mayda on 25/05/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import CoreData


class HealthCheckItem {
    var healthCheckStatusLabel : String = ""
    var healthCheckStatus : Bool = false
    init(healthCheckStatusLabel: String, healthCheckStatus: Bool) {
        self.healthCheckStatus = healthCheckStatus
        self.healthCheckStatusLabel = healthCheckStatusLabel
    }
}


struct HealthCheckReportModel {
    var healthCheckItemArray = [HealthCheckItem]()
    var bodyTemperature : HealthCheckItem
    var cough : HealthCheckItem
    var flu : HealthCheckItem
    var fever : HealthCheckItem
    var throatPain : HealthCheckItem
    var breath: HealthCheckItem
    var symptomp : HealthCheckItem
    
    init() {
        //Body temp
        //Cough
        //Flu
        //Fever
        //Throat Pain
        //Shortness of breath
        //are The Syptomps repidly worsening
    }
}
