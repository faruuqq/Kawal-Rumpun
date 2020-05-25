//
//  GuestUtil.swift
//  KawalRumpunExperiment
//
//  Created by Muhammad Fawwaz Mayda on 25/05/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import CoreData

struct GuestModel {
    var jumlahTamu : Int = 0
    var periodeMenginap : Int = 0
    var date = Date()
    var id_warga = ""
    var id = UUID().uuidString
    var alamat = ""
    
    func save(to context: NSManagedObjectContext) {
        let newGuest = Guest(context: context)
        let newNotif = Notification(context: context)
        newNotif.id = UUID().uuidString
        newNotif.id_related = id
        newNotif.tipe = "Guest"
        newGuest.id = id
        newGuest.id_warga = id_warga
        newGuest.numberOfDays = Int16(periodeMenginap)
        newGuest.numberOfGuests = Int16(jumlahTamu)
        newGuest.guestAddress = alamat
        do {
            try context.save()
            print("Saved")
        } catch {
            print(error)
        }
    }
}
