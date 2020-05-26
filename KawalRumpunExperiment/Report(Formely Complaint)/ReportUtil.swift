//
//  ReportUtil.swift
//  KawalRumpunExperiment
//
//  Created by Muhammad Fawwaz Mayda on 26/05/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import CoreData
import UIKit

struct ReportModel {
    var id: String {
        return UUID().uuidString
    }
    var id_warga : String?
    var keluhanType : String?
    var complaintText : String?
    var imageData : UIImage?
    var date: Date?
    
    func persist(to context: NSManagedObjectContext) {
        print("Mau Nge Save")
        let newReport = Report(context: context)
        let newNotif = Notification(context: context)
        let idBoth = id
        newReport.id = idBoth
        newNotif.id = UUID().uuidString
        newNotif.id_related = idBoth
        if let text =  complaintText {
            print("Complaint")
            newReport.complaint = text
        }
        
        if let date = date {
            print("Date")
            newReport.date = date
        }
        
        if let type = keluhanType {
            print("Type")
            newReport.type = type
        }
        
        if let image = imageData {
            print("Image Data")
            newReport.photo = image.jpegData(compressionQuality: 0.8)
        }
        
        if let id_warga = id_warga {
            print("ID Warga")
            newReport.id_warga = id_warga
        }
        do {
            try context.save()
            print("Saved")

        } catch {
            print("error")
        }
    }
}

enum Keluhan:String {
    case kesehatan = "kesehatan"
    case fasilitas = "fasilitas"
    case sosial = "sosial"
}

extension Report {
    static func save(context : NSManagedObjectContext, report : ReportModel)-> Report? {
        print("Mau Nge Save")
        let newReport = Report(context: context)
        let newNotif = Notification(context: context)
        let idBoth = report.id
        newReport.id = idBoth
        newNotif.id = UUID().uuidString
        newNotif.id_related = idBoth
        if let text = report.complaintText {
            print("Complaint")
            newReport.complaint = text
        }
        
        if let date = report.date {
            print("Date")
            newReport.date = date
        }
        
        if let type = report.keluhanType {
            print("Type")
            newReport.type = type
        }
        
        if let image = report.imageData {
            print("Image Data")
            newReport.photo = image.jpegData(compressionQuality: 0.8)
        }
        
        if let id_warga = report.id_warga {
            print("ID Warga")
            newReport.id_warga = id_warga
        }
        do {
            try context.save()
            print("Saved")
            return newReport
        } catch {
            print("error")
            return nil
        }
}
}
