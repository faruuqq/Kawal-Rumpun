//
//  GuestFirstVC.swift
//  KawalRumpunExperiment
//
//  Created by Muhammad Fawwaz Mayda on 21/05/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import UIKit
import CoreData

class GuestFirstVC: UIViewController {
    var thisGuest = GuestModel()
    
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var tamuTextField: UITextField!
    @IBOutlet weak var alamatTextField: UITextField!
    @IBOutlet weak var periodeTextField: UITextField!
    @IBOutlet weak var kirimButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupIdWarga()
        initialSetup()
        styleButton()
        createTodayLabel()
        // Do any additional setup after loading the view.
    }
    func setupIdWarga() {
        if let idWarga = UserDefaults.standard.string(forKey: "id_warga") {
            thisGuest.id_warga = idWarga
        } else {
            thisGuest.id_warga = "id_dummy_warga"
        }
        
    }
    
    func createTodayLabel() {
        let date = Date()
        let hari : String
        let bulan : String
        let calendar = Calendar.current
        let components = calendar.dateComponents([.weekday,.day,.month,.year], from: date)
               switch components.weekday! {
               case 1:
                    hari = "Minggu"
               case 2:
                    hari = "Senin"
               case 3:
                    hari = "Selasa"
               case 4:
                    hari = "Rabu"
               case 5:
                    hari = "Kamis"
               case 6:
                    hari = "Jumat"
               default:
                    hari = "Sabtu"
               }
               
               switch components.month! {
               case 1:
                    bulan = "Januari"
               case 2:
                    bulan = "Februari"
               case 3:
                    bulan = "Maret"
               case 4:
                    bulan = "April"
               case 5:
                    bulan = "Mei"
               case 6:
                    bulan = "Juni"
               case 7:
                    bulan = "Juli"
               case 8:
                    bulan = "Agustus"
               case 9:
                    bulan = "September"
               case 10:
                    bulan = "Oktober"
               case 11:
                    bulan = "November"
               default:
                    bulan = "Desember"
               }
               todayLabel.text = "\(hari), \(components.day!) \(bulan) \(components.year!)"
    }
    func initialSetup() {
        tamuTextField.text = "0"
        periodeTextField.text = "0"
    }
    func styleButton() {
        kirimButton.backgroundColor = UIColor.blue
        kirimButton.layer.cornerRadius = 10.0
    }
    @IBAction func tamuStepperTapped(_ sender: UIStepper) {
        tamuTextField.text = "\(Int(sender.value))"
    }
    
    @IBAction func periodeSteppedTapped(_ sender: UIStepper) {
        periodeTextField.text = "\(Int(sender.value))"
    }
    
    @IBAction func kirimButtonTapped(_ sender: UIButton) {
        if let alamat = alamatTextField.text, let jumlahTamu = tamuTextField.text, let periode = periodeTextField.text {
            thisGuest.alamat = alamat
            thisGuest.periodeMenginap = Int(periode) ?? 0
            thisGuest.jumlahTamu = Int(jumlahTamu) ?? 0
            thisGuest.save(to: getViewContext()!)
        }
        
    }
}

extension GuestFirstVC {
    func getViewContext()-> NSManagedObjectContext? {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let container = appDelegate?.persistentContainer
        return container?.viewContext
    }
}
