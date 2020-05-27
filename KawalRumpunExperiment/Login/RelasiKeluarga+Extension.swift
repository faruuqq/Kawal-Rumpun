//
//  RelasiKeluarga+Extension.swift
//  KawalRumpunExperiment
//
//  Created by Firza Ilhami on 27/05/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import Foundation
import CoreData

extension RelasiKeluarga {
    
    func save(viewContext: NSManagedObjectContext, dataRegistration: Registration) {
        let coreDataRelasiKeluarga = RelasiKeluarga(context: viewContext)
        coreDataRelasiKeluarga.id = UUID().uuidString
        coreDataRelasiKeluarga.id_warga1 = dataRegistration.email
        coreDataRelasiKeluarga.id_warga2 = dataRegistration.emailFam
        coreDataRelasiKeluarga.relasi = dataRegistration.famRelationType

        do {
            try viewContext.save()
            print("persistent save for Relasi Kluarga is successfully")
        } catch {
            print("error")
        }
    }
    
}
