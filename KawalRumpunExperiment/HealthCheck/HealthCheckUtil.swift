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
    var id_warga = ""
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
        bodyTemperature = HealthCheckItem(healthCheckStatusLabel: "Body Temperature > 37.5 C", healthCheckStatus: true)
        //Cough
        cough = HealthCheckItem(healthCheckStatusLabel: "Cough", healthCheckStatus: false)
        //Flu
        flu = HealthCheckItem(healthCheckStatusLabel: "Flu", healthCheckStatus: false)
        //Fever
        fever = HealthCheckItem(healthCheckStatusLabel: "Fever", healthCheckStatus: false)
        //Throat Pain
        throatPain = HealthCheckItem(healthCheckStatusLabel: "Throat Pain", healthCheckStatus: false)
        //Shortness of breath
        breath = HealthCheckItem(healthCheckStatusLabel: "Shortness of Breath", healthCheckStatus: false)
        //are The Syptomps repidly worsening
        symptomp = HealthCheckItem(healthCheckStatusLabel: "Are the syptomps rapidly worsening?", healthCheckStatus: false)
        
        healthCheckItemArray.append(bodyTemperature)
        healthCheckItemArray.append(cough)
        healthCheckItemArray.append(flu)
        healthCheckItemArray.append(fever)
        healthCheckItemArray.append(throatPain)
        healthCheckItemArray.append(breath)
        healthCheckItemArray.append(symptomp)
    }
    func healthRisk()-> String {
        var count = 0
        for item in healthCheckItemArray {
            if item.healthCheckStatus {
                count+=1
            }
        }
        return (count>healthCheckItemArray.count) ? "High Risk" : "Not high risk"
    }
    func persist(to context: NSManagedObjectContext) {
        let newHealthReport = HealthCheck(context: context)
        let newNotif = Notification(context: context)
        let bothID = UUID().uuidString
        newNotif.id = UUID().uuidString
        newNotif.id_related = bothID
        newNotif.tipe = "HealthCheck"
        newHealthReport.bodyTemp = bodyTemperature.healthCheckStatus
        newHealthReport.breath = breath.healthCheckStatus
        newHealthReport.cough = cough.healthCheckStatus
        newHealthReport.fever = fever.healthCheckStatus
        newHealthReport.flu = flu.healthCheckStatus
        newHealthReport.throatPain = throatPain.healthCheckStatus
        newHealthReport.worstSymtom = symptomp.healthCheckStatus
        newHealthReport.id = bothID
        newHealthReport.id_warga = id_warga
        newHealthReport.date = Date()
        newHealthReport.riskStatus = healthRisk()
        do {
            try context.save()
            print("Saved")
        } catch{
            print(error)
        }
    }
}
