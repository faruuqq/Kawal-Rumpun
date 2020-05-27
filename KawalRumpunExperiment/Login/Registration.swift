//
//  Registration.swift
//  KawalRumpunExperiment
//
//  Created by Firza Ilhami on 28/05/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import Foundation
import CoreData

struct Registration {
    var nama: String
    var email: String
    var noHP: String
    var alamat: String
    var rt: Int16
    var rw: Int16
    var password: String
    var shareLoc: Bool
    var famRelationType: String
    var emailFam: String
    
    func save(viewContext: NSManagedObjectContext){
        let coreDataWarga = Warga(context: viewContext)
        coreDataWarga.name = nama
        coreDataWarga.email = email
        coreDataWarga.hp = noHP
        coreDataWarga.rt = rt
        coreDataWarga.rw = rw
        coreDataWarga.alamat = alamat
        coreDataWarga.id = UUID().uuidString
        coreDataWarga.willingToTrack = shareLoc
        coreDataWarga.password = password
        
        let coreDataRelasiKeluarga = RelasiKeluarga(context: AppDelegate.viewContext)
        coreDataRelasiKeluarga.id = UUID().uuidString
        coreDataRelasiKeluarga.id_warga1 = email
        coreDataRelasiKeluarga.id_warga2 = emailFam
        coreDataRelasiKeluarga.relasi = famRelationType

        do {
            try AppDelegate.viewContext.save()
            print("All data have been succesfully saved within persistent core data")
        } catch {
            print("error")
        }

    }
    
}
