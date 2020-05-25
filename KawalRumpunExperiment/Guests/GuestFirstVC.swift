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
        // Do any additional setup after loading the view.
    }
    func setupIdWarga() {
        if let idWarga = UserDefaults.standard.string(forKey: "id_warga") {
            thisGuest.id_warga = idWarga
        } else {
            thisGuest.id_warga = "id_dummy_warga"
        }
        
    }
    
    func initialSetup() {
        tamuTextField.text = "0"
        periodeTextField.text = "0"
    }
    func styleButton() {
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
