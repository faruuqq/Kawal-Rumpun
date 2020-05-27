//
//  ReportFirstVC.swift
//  KawalRumpunExperiment
//
//  Created by Muhammad Fawwaz Mayda on 21/05/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import UIKit
import CoreData

class ReportFirstVC: UIViewController {
    let date = Date()
    var currentIdWarga = ""
    var thisReport = ReportModel()
    let selectedBackgroundColor = UIColor(red: 47/255.0, green: 128.0/255.0, blue: 237.0/255.0, alpha: 1.0)
    @IBOutlet weak var complaintTextField: UITextField!
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var kesehatanButton: UIButton!
    @IBOutlet weak var fasilitasButton: UIButton!
    @IBOutlet weak var sosialButton: UIButton!
    @IBOutlet weak var selanjutnyaButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Asume we have the user already logged in
        if let userDefaultsIdWarga = UserDefaults.standard.string(forKey: "id_warga") {
            currentIdWarga = userDefaultsIdWarga
        } else {
            currentIdWarga = "id_dummy_warga"
        }
        thisReport.id_warga = currentIdWarga
        // Do any additional setup after loading the view.
        setupView()
        styleButton()
        reportTypeButtonTapped(kesehatanButton)
    }
    func styleButton() {
        
        selanjutnyaButton.backgroundColor = UIColor.init(red: 85/255.0, green: 138/255.0, blue: 232/255.0, alpha: 1.0)
        selanjutnyaButton.layer.shadowColor = UIColor.black.cgColor
        selanjutnyaButton.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        selanjutnyaButton.layer.shadowRadius = 2.0
        selanjutnyaButton.layer.shadowOpacity = 0.3
        selanjutnyaButton.layer.cornerRadius = 8.0
    }
    func setupView() {
        for button in [fasilitasButton,kesehatanButton,sosialButton] {
            button?.layer.cornerRadius = 10.0
            button?.layer.borderColor = UIColor.black.cgColor
            button?.layer.borderWidth = 0.2
            button?.backgroundColor = UIColor.clear
        }
        
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.generatesCalendarDates = true
        formatter.locale = Locale(identifier: "id_ID")
        let dateString = formatter.string(from: currentDateTime)
        todayLabel.text = dateString
    }
    
    @IBAction func addPhotoTapped(_ sender: UIButton) {
        print("TAP")
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("Camera")
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .camera
            present(imagePicker,animated: true)
        } else if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .photoLibrary
            present(imagePicker,animated: true)
            print("Photo Lib")
        }
        print("No Presents")
     
    }
    @IBAction func reportTypeButtonTapped(_ sender: UIButton) {
        for button in [fasilitasButton,kesehatanButton,sosialButton] {
            if button==sender {
                button?.backgroundColor = selectedBackgroundColor
                button?.setTitleColor(.white, for: .normal)
            } else {
                button?.backgroundColor = UIColor.clear
                button?.setTitleColor(.black, for: .normal)
               
            }
        }
        switch sender {
        case fasilitasButton:
            thisReport.keluhanType = Keluhan.fasilitas.rawValue
        case kesehatanButton:
            thisReport.keluhanType = Keluhan.kesehatan.rawValue
        default:
            thisReport.keluhanType = Keluhan.sosial.rawValue
        }
    }
    
    @IBAction func sendReportTapped(_ sender: UIButton) {
        if let actualText = complaintTextField.text {
            thisReport.complaintText = actualText
        }
        thisReport.date = date
        if let context = getViewContext() {
            thisReport.persist(to: context)
        }
    }
    
    
}

extension ReportFirstVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else {fatalError("Cant convert to UIImage")}
        thisReport.imageData = image
        dismiss(animated: true)
    }
}

extension ReportFirstVC {
    func getViewContext() -> NSManagedObjectContext? {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let container = appDelegate?.persistentContainer
        return container?.viewContext
    }
}
