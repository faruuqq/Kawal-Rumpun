//
//  ReportFirstVC.swift
//  KawalRumpunExperiment
//
//  Created by Muhammad Fawwaz Mayda on 21/05/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import UIKit
import CoreData


struct ReportModel {
    var id: String {
        return UUID().uuidString
    }
    var id_warga : String?
    var keluhanType : String?
    var complaintText : String?
    var imageData : UIImage?
    var date: Date?
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

class ReportFirstVC: UIViewController {
    let date = Date()
    var currentIdWarga = ""
    var thisReport = ReportModel()
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
    }
    func styleButton() {
        
        selanjutnyaButton.backgroundColor = UIColor.blue
        selanjutnyaButton.layer.shadowColor = UIColor.black.cgColor
        selanjutnyaButton.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        selanjutnyaButton.layer.shadowRadius = 2.0
        selanjutnyaButton.layer.shadowOpacity = 0.3
        selanjutnyaButton.layer.cornerRadius = 8.0
    }
    func setupView() {
        for button in [fasilitasButton,kesehatanButton,sosialButton] {
            button?.layer.cornerRadius = 10.0
            button?.backgroundColor = UIColor.systemGray2
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
                button?.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
            } else {
                button?.backgroundColor = UIColor.systemGray2
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
            Report.save(context: context, report: self.thisReport)
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
