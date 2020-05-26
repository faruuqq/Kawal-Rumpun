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
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.generatesCalendarDates = true
        formatter.locale = Locale(identifier: "id_ID")
        todayLabel.text = "\(formatter.string(from: date))"
    }
    func initialSetup() {
        tamuTextField.text = "0"
        periodeTextField.text = "0"
    }
    func styleButton() {
        kirimButton.backgroundColor = UIColor.blue
        kirimButton.layer.cornerRadius = 8.0
        kirimButton.layer.shadowColor = UIColor.black.cgColor
        kirimButton.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        kirimButton.layer.shadowRadius = 2.0
        kirimButton.layer.shadowOpacity = 0.3
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
